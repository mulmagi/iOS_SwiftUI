//
//  CamerView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/30.
//

import SwiftUI
import AVKit

struct CameraView: UIViewRepresentable {
    var frameSize: CGSize
    
    // Camera Session
    @Binding var session: AVCaptureSession // IO Device(Camera, Mike, ..)로 받은 Data 처리
    
    func makeUIView(context: Context) -> UIView {
        // Define camera Frame Size
        let view = UIViewType(frame: CGRect(origin: .zero, size: frameSize))
        view.backgroundColor = .clear
        
        let cameraLayer = AVCaptureVideoPreviewLayer(session: session) // Camera Previewer
        cameraLayer.frame = .init(origin: .zero, size: frameSize)
        cameraLayer.videoGravity = .resizeAspectFill
        cameraLayer.masksToBounds = true
        view.layer.addSublayer(cameraLayer)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
