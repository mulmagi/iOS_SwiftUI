//
//  ScanView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/29.
//

import SwiftUI
import AVFoundation

struct ScanView: View {
    @State private var session: AVCaptureSession = .init()
    @State private var qrOutput: AVCaptureMetadataOutput = .init()
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainBlue.ignoresSafeArea()
                
                ZStack {
                    VStack(alignment: .center, spacing: 23) {
                        VStack(spacing: 6) {
                            Text("우산보관함 하단의")
                                .foregroundColor(.white)
                                .font(.medium15)
                            Text("QR 코드 스캔")
                                .foregroundColor(.white)
                                .font(.bold20)
                        }
                        
                        
                        // TODO: QR 스캔 박스
                        ZStack {
                            ForEach (0...4, id: \.self) { index in
                                let rotation = Double(index) * 90
                                
                                RoundedRectangle(cornerRadius: 2, style: .circular)
                                    .trim(from: 0.61, to: 0.64)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                    .frame(width: 199, height: 199)
                                    .rotationEffect(.init(degrees: rotation))
                            }
                            
                            CameraView(frameSize: CGSize(width: 199, height: 199), session: $session)
                                .frame(width: 199, height: 199)
                            
                        }
                        .padding(.bottom, 30)
                        
                        HStack(alignment: .bottom, spacing: 70) {
                            VStack() {
                                Image("keyboard")
                                Text("코드 입력")
                                    .foregroundColor(.white)
                                    .font(.medium15)
                            }
                            
                            VStack {
                                Image("flashlight")
                                Text("손전등")
                                    .foregroundColor(.white)
                                    .font(.medium15)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("대여하기")
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
