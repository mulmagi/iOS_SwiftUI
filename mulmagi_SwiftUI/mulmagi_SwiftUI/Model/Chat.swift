//
//  Chat.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/06.
//

import Foundation
import SwiftUI
//{
//    "statusCode": 200,
//    "responseMessage": "메시지 목록 불러오기 성공"
//        "data": [ //채팅방의 메시지 목록
//    {
//      "id": 1, //메시지 ID
//      "userId": 2, //채팅방 id(사용자 id)
//      "contents": "문의드릴게 있습니다", //메시지 내용
//      "type": "TEXT", //메시지 타입
//            "isAdmin": false //사용자가 보낸 메시지
//    },
//    {
//      "id": 2,
//      "userId. ": 2,
//      "contents": "넵 사진 보내주세요",
//      "type": "TEXT",
//            "isAdmin": true //관리자가 보낸 메시지
//    },
//    {
//      "id": 3,
//      "userId": 2,
//      "contents": "http://...s3이미지주소", //image url
//      "type": "IMAGE", //내용이 이미지임
//            "isAdmin": false
//    }
//  ]
//}

struct Chat: Identifiable {
    let id: Int
    let userId: Int
    let contents: String
    let contentType: String
    let isAdmin: Bool
    let date: Date
}

let chatMessage = [
    Chat(id: 1, userId: 1, contents: "안녕하세요. 무엇을 도와드릴까요?\n상담원의 답변까지 약 10분이 소요됩니다.", contentType: "TEXT", isAdmin: true, date: Date(timeInterval: 300, since: Date())),
    Chat(id: 2, userId: 1, contents: "나는 손님이용.", contentType: "TEXT", isAdmin: false, date: Date(timeInterval: 300, since: Date())),
    Chat(id: 3, userId: 1, contents: "문의 좀 하고 싶쏭ㅇ .", contentType: "TEXT", isAdmin: false, date: Date(timeInterval: 300, since: Date())),
    Chat(id: 4, userId: 1, contents: "환불 plz,,,", contentType: "TEXT", isAdmin: false, date: Date(timeInterval: 300, since: Date())),
    Chat(id: 5, userId: 1, contents: "물막이 임댕.", contentType: "TEXT", isAdmin: true, date: Date(timeInterval: 300, since: Date())),
    Chat(id: 6, userId: 1, contents: "죄송합니다 고객님.이용약관 내에 기재되어있는 사항으로,1년이 지난 결제 금액은 환불이 불가합니다.", contentType: "TEXT", isAdmin: true, date: Date(timeInterval: 300, since: Date()))
]
