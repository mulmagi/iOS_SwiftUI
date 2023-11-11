//
//  NoticeButton.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/11.
//

import SwiftUI

struct NoticeButton: View {
    var body: some View {
        NavigationLink(destination: ContentView()) {
            
            HStack (alignment: .center, spacing: 20) {
                Image("alarm-icon")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Text("공지사항")
                    .font(.medium17)
                    .foregroundColor(.darkNavy)
                
                Spacer()
                
                Image("alarm-icon")
                    .padding(.trailing, 25)
                    .foregroundColor(.darkGray)
            }
            
        }
        .padding(EdgeInsets(top: 19, leading: 20, bottom: 19, trailing: 23))
        .background(.white)
        
        .cornerRadius(15)
    }
}

struct NoticeButton_Previews: PreviewProvider {
    static var previews: some View {
        NoticeButton()
    }
}
