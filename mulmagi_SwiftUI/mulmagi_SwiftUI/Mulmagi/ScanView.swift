//
//  ScanView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/29.
//

import SwiftUI
import AVKit

struct ScanView: View {
    
    @State private var session: AVCaptureSession = .init()
    @State private var qrOutput: AVCaptureMetadataOutput = .init()
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    @State private var cameraPermission: Permission = .idle
    @Environment(\.openURL) private var openURL
    @ObservedObject private var qrDelegate = QRScannerDelegate()
    @State private var isCorrectCode: Bool = false
    @State private var moveToOTP: Bool = false
    
    @State private var moveToHome: Bool = false
    @State private var denyScan: Bool = true
    @State private var moveBack: Bool = false
    
    var body: some View {
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
                    //  Check Camera Permission
                    .onAppear(perform: checkCameraPermission)
                    .alert(errorMessage, isPresented: $showError) {
                        // Showing setting's button, if permission is denied
                        if cameraPermission == .denied {
                            Button("Settings") {
                                let settingString = UIApplication.openSettingsURLString
                                if let settingURL = URL(string: settingString) {
                                    // Opening App's Setting, Using openURl SwiftUI API
                                    openURL(settingURL)
                                }
                            }
                            
                            // 취소 버튼
                            Button("Cancel", role: .cancel) {
                                
                            }
                        }
                    }
                    
                    HStack(alignment: .bottom, spacing: 70) {
                        Button {
                            moveToOTP = true
                        } label: {
                            VStack {
                                Image("keyboard")
                                Text("코드 입력")
                                    .foregroundColor(.white)
                                    .font(.medium15)
                            }
                        }
                        .fullScreenCover(isPresented: $moveToOTP) {
                            OTPView()
                        }

                        
                        
                        Button {
                            // TOOD: flashlight
                        } label: {
                            VStack {
                                Image("flashlight")
                                Text("손전등")
                                    .foregroundColor(.white)
                                    .font(.medium15)
                            }
                        }
                    }
                    

                }
                .alert(isPresented: Binding<Bool>(
                    get: { qrDelegate.isCorrectCode || qrDelegate.isUnable },
                    set: { _, _ in }
                )) {
                    if qrDelegate.isCorrectCode {
                        return Alert(
                            title: Text("대여하기"),
                            message: Text("대여하시겠습니까?"),
                            primaryButton: .cancel(Text("취소")),
                            secondaryButton: .default(Text("확인")) {
                                moveToHome = true
                            }
                        )
                    } else if qrDelegate.isUnable {
                        return Alert(
                            title: Text("대여불가"),
                            message: Text("대여 가능한 우산이 없습니다."),
                            dismissButton: .default(Text("확인")) {
                                moveBack = true
                            }
                        )
                    } else {
                        return Alert(title: Text(""), message: Text("")) // Empty alert when neither condition is true
                    }
                }
                
//                .alert(isPresented: $qrDelegate.isUnable, content: {
//                    Alert(title: Text("대여불가"), message: Text("대여 가능한 우산이 없습니다."), dismissButton: .default(Text("확인")) { moveBack = true})
//                })
//                .alert(isPresented: $qrDelegate.isCorrectCode, content: {
//                    return Alert(title: Text("대여하기"), message: Text("대여하시겠습니까?"), primaryButton: .cancel(Text("취소")), secondaryButton: .default(Text("확인")) { moveToHome = true})
//
//                })
                .fullScreenCover(isPresented: $moveToHome) {
                    RentCheckView()
                }
                .fullScreenCover(isPresented: $moveBack) {
                    MainTabbedView()
                }
            }
            
        }
    }
        
        
    
    
    // Check Camera Permission
    func checkCameraPermission() {
        Task {
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                cameraPermission = .approved
                setUpCamera()
            case .notDetermined:
                // Request Camera Access
                if await AVCaptureDevice.requestAccess(for: .video) {
                    // Permission Granted
                    cameraPermission = .approved
                    setUpCamera()
                } else {
                    // Permission Denied
                    cameraPermission = .denied
                    
                    // Present Error Message
                    presentError("QR 스캔을 위해 카메라 접근을 허용해주세요.")
                }
            case .denied, .restricted:
                cameraPermission = .denied
                presentError("QR 스캔을 위해 카메라 접근을 허용해주세요.")
            default: break
            }
        }
    }
    
    func setUpCamera() {
        do {
            guard let device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices.first else {
                presentError("Unknown Error")
                return
            }
            
            // Camera Input
            let input = try AVCaptureDeviceInput(device: device)
            
            guard session.canAddInput(input), session.canAddOutput(qrOutput) else {
                presentError("Unknown Error")
                return
            }
            
            // Add Input, Output to Camera Session
            session.beginConfiguration()
            session.addInput(input)
            session.addOutput(qrOutput)
            
            // Output config to read QR Code
            qrOutput.metadataObjectTypes = [.qr]
            
            // Add Delegate to Retriece the Fetched QR From Camera
            qrOutput.setMetadataObjectsDelegate(qrDelegate, queue: .main)
            session.commitConfiguration()
            
            // Session Start at Background
            DispatchQueue.global(qos: .background).async {
                session.startRunning()
            }
            
        } catch {
            presentError(error.localizedDescription)
        }
    }
    
    func presentError(_ message: String) {
        errorMessage = message
        showError.toggle()
    }
}


struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
