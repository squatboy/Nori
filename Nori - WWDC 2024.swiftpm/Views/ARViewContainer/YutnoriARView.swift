import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct YutnoriARView : View {
    @State private var showModel = false
    
    var body: some View {
        ZStack {
            YutnoriARViewContainer(showModel: $showModel)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                if(!showModel) {
                    Text("Aim for a surface in the current space and then press the button to load the logarithmic model.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 200)
                        .padding(.vertical, 20)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                
                Button(action: {
                    self.showModel = true
                }) {
                    Image(systemName: self.showModel ? "checkmark.square.fill" : "plus.app.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .background(self.showModel ? Color.green : Color.orange)
                        .cornerRadius(10)
                }
                .padding(.bottom, 40)
                .disabled(showModel)
            }
        }
    }
}

struct YutnoriARViewContainer: UIViewRepresentable {
    @Binding var showModel: Bool
    
    func makeUIView(context: Context) -> ARView {
        let arView = CustomARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if showModel {
            let modelEntity = try! ModelEntity.load(named: "Yut.usdz")
            
            let anchorEntity = AnchorEntity(world: [0, 0, -80])
            anchorEntity.addChild(modelEntity)
            uiView.scene.addAnchor(anchorEntity)
            
            let newYPosition: Float = -100.0
            var modelTransform = Transform()
            modelTransform.translation.y = newYPosition
            modelEntity.transform = modelTransform
            
            for anim in modelEntity.availableAnimations {
                modelEntity.playAnimation(anim.repeat(duration: .infinity), transitionDuration: 1.25, startsPaused: false)
            }
            
        }
    }
}

private class CustomARView: ARView {
    let focusSquare = FESquare()
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        focusSquare.viewDelegate = self
        focusSquare.delegate = self
        focusSquare.setAutoUpdate(to: true)
        setupARView()
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupARView() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        self.session.run(config)
    }
}

extension CustomARView: FEDelegate {
    func toTrackingState() {
        print("tracking")
    }
    
    func toInitializingState() {
        print("Initializing")
    }
}
