import SwiftUI
import RealityKit
import ARKit

struct DDakjiChigiARView : View {
    var body: some View {
        DDakjiChigiARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct DDakjiChigiARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        setupARView(arView)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {

        let modelEntity = try! ModelEntity.load(named: "DDakjiChigi.usdz")
        
        let anchorEntity = AnchorEntity()
        
        anchorEntity.addChild(modelEntity)
        
        uiView.scene.addAnchor(anchorEntity)
        
        for anim in modelEntity.availableAnimations {
            modelEntity.playAnimation(anim.repeat(duration: .infinity), transitionDuration: 1.25, startsPaused: false)
        }
    }
    
    private func setupARView(_ arView: ARView) {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
    }
}


