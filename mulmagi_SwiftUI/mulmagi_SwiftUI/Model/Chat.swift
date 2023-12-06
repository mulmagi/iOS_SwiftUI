//
//  Chat.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/06.
//

import Foundation
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

struct Chat {
    let id: Int
    let userId: Int
    let contents: String
    let contentType: String
    let isAdmin: Bool
    let date: Date
}
