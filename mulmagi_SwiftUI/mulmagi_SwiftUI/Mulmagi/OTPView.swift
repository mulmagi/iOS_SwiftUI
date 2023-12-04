//
//  OTPView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/04.
//

import SwiftUI

struct OTPView: View {
    @State private var otpText: String = ""
    @FocusState private var isKeyboardShowing: Bool
    @State private var isVerificationSuccessful = false
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Color.backgroundBlue.ignoresSafeArea()
            VStack (alignment: .center) {
                HStack(spacing: 10) {
                    ForEach(0..<6, id: \.self) { index in
                        OTPTextBox(index)
                    }
                }
                .background(content: {
                    EmptyView()
                        .overlay(
                            TextField("", text: $otpText.limit(6))
                                .opacity(0)
                                .keyboardType(.numberPad)
                                .focused($isKeyboardShowing)
                                .textContentType(.oneTimeCode)
                        )
                })
                .contentShape(Rectangle())
                .padding(.top, 175)
                .onChange(of: otpText) { newValue in
                        if newValue.count == 6 {
                            verifyOTP(otp: newValue)
                        }
                    }

                
                NavigationLink {
                    ScanView()
                } label: {
                    VStack {
                        Image("scan")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.darkNavy)
                        Text("QR 촬영")
                            .font(.medium15)
                            .foregroundColor(.darkNavy)
                    }
                }
                .padding(.top, 130)
                Spacer()
            }
            .onAppear {
                isKeyboardShowing = true // 뷰가 나타날 때 키보드를 자동으로 활성화
            }
        }
        .fullScreenCover(isPresented: $isVerificationSuccessful) {
            // TOOD: 대여 확인창으로 이동
            ContentView()
        }
        .alert(isPresented: $showingAlert) {
            alertMessage(errorCase: "이미 대여중인 사용자입니다.")
        }
    }

    
    func OTPTextBox(_ index: Int) -> some View {
        let char: Character = otpText.count > index ? otpText[otpText.index(otpText.startIndex, offsetBy: index)] : " "
        
        return Text(String(char))
            .frame(width: 45, height: 45)
        //            .background(otpText.count > index ? Color.mainBlue.opacity(0.2) : Color.lightGray.opacity(0.2))
            .background {
                let status = (isKeyboardShowing && otpText.count == index)
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(status ? .mainBlue: Color.lightGray, lineWidth: status ? 2.5 : 2)
                    .animation(.easeInOut(duration: 0.2), value: status)
            }
    }
    
    func verifyOTP(otp: String) {
        // OTP 검증 로직...
        
        if otp == "123456" {
            isVerificationSuccessful = true
        } else {
            // 알림창 띄우기
            showingAlert = true
        }
    }
    
    func alertMessage(errorCase: String) -> Alert {
        var errorMessage: String = ""
        if errorMessage == "Umbrella stand not found" {
            errorMessage = "올바른 대여 코드를 입력해주세요."
        } else {
            errorMessage = errorCase
        }
        
        return Alert(title: Text("대여불가"), message: Text(errorMessage), dismissButton: .default(Text("확인")))
    }

}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
