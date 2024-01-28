//
//  YutnoriARView.swift
//  Nori - WWDC 2024
//
//  Created by 이재영 on 1/28/24.
//

import SwiftUI
import ARKit
import RealityKit

struct YutnoriARView: UIViewRepresentable {
    
    @Binding var boardPlaceConfirmed: Bool
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        setupARView(arView)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // boardPlaceConfirmed가 true일 때 모델을 추가
        if boardPlaceConfirmed {
            let modelEntity = try! ModelEntity.load(named: "Yut.usdz")
            
            let anchorEntity = AnchorEntity()
            
            anchorEntity.addChild(modelEntity)
            
            uiView.scene.addAnchor(anchorEntity)
            
            for anim in modelEntity.availableAnimations {
                modelEntity.playAnimation(anim.repeat(duration: .infinity), transitionDuration: 1.25, startsPaused: false)
            }
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


