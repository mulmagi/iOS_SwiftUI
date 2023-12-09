//
//  PointHistory.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/10.
//


import Foundation
import SwiftUI

//{
//  "statusCode": 200,
//  "responseMessage": "포인트 내역 불러오기 성공",
//  "data": [
//    {
//      "amount": 5000,
//      "transactionType": "충전",
//      "createdAt": "2023-12-05T19:49:39"
//    },
//    {
//      "amount": -9000,
//      "transactionType": "보증금",
//      "createdAt": "2023-12-05T19:46:42"
//    },
//    {
//      "amount": -1000,
//      "transactionType": "대여료",
//      "createdAt": "2023-12-05T19:46:42"
//    },
//    {
//      "amount": 10000,
//      "transactionType": "충전",
//      "createdAt": "2023-12-05T19:45:45"
//    }
//  ]
//}

struct PointHistory: Identifiable {
    let id = UUID()
    let amount: String
    let transactionType: String
    let date: Date
}

var pointHistoryData: [PointHistory] = [
    PointHistory(amount: "+10000", transactionType: "충전", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "+20000", transactionType: "충전", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-1000", transactionType: "대여료", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "+30000", transactionType: "충전", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "+40000", transactionType: "충전", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-1000", transactionType: "대여료", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-10000", transactionType: "보증금", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-10000", transactionType: "보증금", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-3000", transactionType: "대여료", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-10000", transactionType: "보증금", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-10000", transactionType: "보증금", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-1000", transactionType: "대여료", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-1000", transactionType: "대여료", date: Date(timeInterval: 300, since: Date())),
    PointHistory(amount: "-5000", transactionType: "대여료", date: Date(timeInterval: 300, since: Date()))
]
