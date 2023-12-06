//
//  MessageStyle.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/06.
//

import SwiftUI

struct MulmagiText: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.medium15)
            .padding(EdgeInsets(top: 8, leading: 15, bottom: 15, trailing: 8))
            .background(Color.white)
            .cornerRadius(18)
            .foregroundColor(.darkNavy)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct UserText: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.medium15)
            .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
            .background(Color.mainBlue)
            .cornerRadius(18)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct MessageStyle_Previews: PreviewProvider {
    static var previews: some View {
        MulmagiText("포인트 환불 plz,,")
    }
}
