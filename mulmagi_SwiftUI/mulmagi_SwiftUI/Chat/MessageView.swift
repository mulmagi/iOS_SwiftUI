//
//  MessageView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/09.
//

import SwiftUI

let columns = [GridItem(.flexible(minimum: 10))]

func getMessagesView(viewWidth: CGFloat) -> some View {
    LazyVGrid (columns: columns, spacing: 15) {
        ForEach(chatMessage) { message in
            let isReceived = message.isAdmin
            HStack {
                ZStack {
                    Text(message.contents)
                        .font(.medium15)
                        .foregroundColor(isReceived ? .darkNavy : .white)
                        .lineSpacing(10)
                        .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        .background(isReceived ? .white : .mainBlue)
                }
                .cornerRadius(15)
                .frame(width: viewWidth * 0.8, alignment: isReceived ? .leading : .trailing)
            }
            .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
            .id(message.id) // 주후 자동스크롤에서 사용 예정
        }
    }
}
