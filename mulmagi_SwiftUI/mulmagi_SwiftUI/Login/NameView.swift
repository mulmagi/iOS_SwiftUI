//
//  NameView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/01.
//

import SwiftUI

struct NameView: View {
    @State var userName: String = ""
    @State private var isInvalidInput: Bool = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 3) {
                Text("이름")
                    .font(.medium15)
                    .foregroundColor(.darkNavy)
                    .padding(.top, 40)
                Text("이름을 입력해주세요.")
                    .font(.medium10)
                    .foregroundColor(.lineGray)
                    .padding(.bottom, 6)
                
                TextField("", text: $userName)
                    .frame(height: 46)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.darkNavy, lineWidth: 0.5))
                    .onChange(of: userName, perform: { value in
                        if value.contains(where: { !$0.isLetter }) {
                            isInvalidInput = true
                        } else {
                            isInvalidInput = false
                        }
                    })
                
                if isInvalidInput {
                    Text("특수기호와 숫자를 제외한 문자만 입력해주세요.")
                        .foregroundColor(.red)
                        .font(.medium10)
                }
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    HStack {
                        Text("다음")
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .padding(.horizontal, 20)
                            .background((RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(isInvalidInput || userName.isEmpty ? .lightGray : .mainBlue)))
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 10)
                .disabled(isInvalidInput)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("회원가입")
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
