//
//  MessageView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/09.
//

import SwiftUI

let columns = [GridItem(.flexible(minimum: 10))]

func getMessagesView(viewWidth: CGFloat) -> some View {
    LazyVGrid (columns: columns, spacing: 15, pinnedViews: [.sectionHeaders]) {
        let sectionMessages = getSectionMessages()
        
        ForEach (sectionMessages.indices, id: \.self) { sectionIndex in
            let messages = sectionMessages[sectionIndex]
            Section (header: sectionHeader(firstMessage: messages.first!)) {
                
                ForEach(messages) { message in
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
    }
}

func getSectionMessages() -> [[Chat]] {
    var res = [[Chat]]()
    var tmp = [Chat]()
    for message in chatMessage {
        if let firstMessage = tmp.first {
            let daysBetween = firstMessage.date.daysBetween(date: message.date)
            
            if daysBetween >= 1 {
                res.append(tmp)
                tmp.removeAll()
                tmp.append(message)
            } else {
                tmp.append(message)
            }
        } else {
            tmp.append(message)
        }
    
    }
    res.append(tmp)
    return res
}

func sectionHeader(firstMessage message: Chat) -> some View {
    ZStack {
        Color.backgroundBlue
        
        Text(message.date.descriptiveStrinig(dateStyle: .full))
            .font(.system(size: 11))
            .foregroundColor(.black.opacity(0.6))
            .padding(.vertical, 5)
    }
    .frame(maxWidth: .infinity)
}
