//
//  PhoneNumView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/01.
//

import SwiftUI

struct PhoneNumView: View {
    @State var phoneNum: String = ""
    @State private var isInvalidInput: Bool = false
    @State private var phoneNumIsValid: Bool = false
    
    @State private var certificateNum: String = ""
    @State private var certificateComplete: Bool = false
    @State var isButtonClicked: Bool = false
    
    @State var isLoginSuccess = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 3) {
                Text("전화번호")
                    .font(.medium15)
                    .foregroundColor(.darkNavy)
                    .padding(.top, 40)
                Text("전화번호를 입력해주세요.")
                    .font(.medium10)
                    .foregroundColor(.lineGray)
                    .padding(.bottom, 6)
                
                // Input: phoneNum
                TextField("휴대폰 번호(-없이 숫자만 입력)", text: $phoneNum)
                    .multilineTextAlignment(.leading)
                    .keyboardType(.numberPad)
                    .padding(.leading, 20)
                    .frame(height: 46)
                    .foregroundColor(.darkNavy)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.darkNavy, lineWidth: 0.5))
                    .onChange(of: phoneNum, perform: { value in
                        if value.contains(where: { !$0.isNumber }) {
                            isInvalidInput = true
                        } else {
                            isInvalidInput = false
                        }
                    })
                
                if isInvalidInput || phoneNum.count > 11 {
                    Text("-없이 숫자 11자리를 입력해주세요.")
                        .foregroundColor(.red)
                        .font(.medium10)
                }
                
                    Button {
                        self.isButtonClicked.toggle()
                        // API 연결
                        // 인증번호 받기
                        
                    } label: {
                        Text(isButtonClicked ? "인증문자 다시 받기" : "인증문자 받기")
                            .font(.medium15)
                            .frame(maxWidth: .infinity)
                            .frame(height: 46)
                            .padding(.horizontal, 20)
                            .foregroundColor(!isInvalidInput && phoneNum.count == 11 ? .mainBlue : .lightGray)
                            .overlay(RoundedRectangle(cornerRadius: 14)
                                .stroke(!isInvalidInput && phoneNum.count == 11 ? Color.mainBlue : Color.lightGray, lineWidth: 0.5))
                    }
                    .disabled((isInvalidInput && phoneNum.count == 11))
                    .padding(.top, 9)
                    .padding(.bottom, 20)
                
                if isButtonClicked {
                    // Input: Certification Number
                    TextField("인증번호 입력", text: $certificateNum)
                        .keyboardType(.numberPad)
                        .padding(.leading, 20)
                        .frame(height: 46)
                        .foregroundColor(.darkNavy)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.darkNavy, lineWidth: 0.5))
                        .onChange(of: phoneNum, perform: { value in
                            if value.contains(where: { !$0.isNumber }) {
                                isInvalidInput = true
                            } else {
                                isInvalidInput = false
                            }
                        })
                        .padding(.bottom, 4)
                    
                    Text("타인에게 공유하지 마세요!")
                        .font(.medium10)
                        .foregroundColor(.lineGray)
                    
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: ContentView()) {
                            Text("이용약관 및 개인정보취급방침")
                                .underline()
                                .font(.gmarket(.medium, size: 13))
                                .foregroundColor(.lineGray)
                                .padding(.horizontal)
                        }
                        Spacer()
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
                
                
                Button {
                    // API 연결
                    // 인증번호 확인
                    isLoginSuccess = true
                    
                } label: {
                    Text("동의하고 시작하기")
                        .font(.medium15)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .padding(.horizontal, 20)
                        .foregroundColor(.white)
                        .background(certificateNum.isEmpty ? Color.lightGray : Color.mainBlue)
                        .cornerRadius(14)
                }
                .padding(.bottom, 10)
                .disabled(certificateNum.isEmpty)
                
                
            } // VStack
            .padding(.horizontal, 20)
            
        }
        .navigationBarBackButtonHidden(true)
        
        .fullScreenCover(isPresented: $isLoginSuccess) {
            MainTabbedView()
        }
    }
}

struct PhoneNumView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumView()
    }
}
