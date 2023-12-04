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
    
    var body: some View {
        VStack {
            HStack(spacing: 6) {
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
            .onTapGesture {
                isKeyboardShowing = true
            }
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
