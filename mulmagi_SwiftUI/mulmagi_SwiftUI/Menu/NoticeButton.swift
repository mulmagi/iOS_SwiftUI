//
//  NoticeButton.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/11.
//

import SwiftUI

struct NoticeButton: View {
    @State private var moveToNoticeView: Bool = false
    
    var body: some View {
        Button {
            moveToNoticeView.toggle()
        } label: {
            HStack (alignment: .center, spacing: 20) {
                Image("alarm-icon")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Text("공지사항")
                    .font(.medium17)
                    .foregroundColor(.darkNavy)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.trailing, 25)
                    .foregroundColor(.darkGray)
            }
            .padding(EdgeInsets(top: 19, leading: 20, bottom: 19, trailing: 23))
            .background(.white)
            
            .cornerRadius(15)
        }
        .fullScreenCover(isPresented: $moveToNoticeView) {
            NoticeView()
        }
    }
}

struct NoticeButton_Previews: PreviewProvider {
    static var previews: some View {
        NoticeButton()
    }
}
