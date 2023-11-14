//
//  Notification.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/14.
//

import Foundation
struct Data: Hashable {
    let type: String
    let header: String
    let title: String
    let body: String?
    let date: Date
    
    var year: Int {
        Calendar.current.component(.year, from: date)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: date)
    }
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        return formatter.string(from: date)
    }
    
    var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
}

var dataExampleWhole: [Data] = [
    Data(type: "포인트", header: "반환", title: "+ 1,000 포인트 반환 완료", body: "1, 000 포인트 > 2, 000 포인트", date: Date()),
    Data(type: "기타", header: "공지", title: "이용 요금 인상 안내.", body: nil, date: Date()),
    Data(type: "대여 / 반납", header: "반납", title: "가톨릭대학교 성모병원 | 1번 반납 완료.", body: nil, date: Date()),
    Data(type: "대여 / 반납", header: "사용", title: "- 2,000 포인트 사용 완료", body: "10, 000 포인트 > 8, 000 포인트", date: Date()),
    Data(type: "기타", header: "공지", title: "오류로 인한 포인트 일괄 지급 안내.", body: nil, date: Date()),
    Data(type: "대여 / 반납", header: "시간", title: "물막이 반난 시간이 10분 남았습니다.", body: nil, date: Date())

]

var dataExamplePoint: [Data] = [
    Data(type: "포인트", header: "반환", title: "+ 1,000 포인트 반환 완료", body: "1, 000 포인트 > 2, 000 포인트", date: Date()),
    Data(type: "대여 / 반납", header: "사용", title: "- 2,000 포인트 사용 완료", body: "10, 000 포인트 > 8, 000 포인트", date: Date())
]

var dataExampleElse: [Data] = [
    Data(type: "기타", header: "공지", title: "이용 요금 인상 안내.", body: nil, date: Date()),
    Data(type: "기타", header: "공지", title: "오류로 인한 포인트 일괄 지급 안내.", body: nil, date: Date())
]

var dataExampleBorrow: [Data] = [
    Data(type: "대여 / 반납", header: "반납", title: "가톨릭대학교 성모병원 | 1번 반납 완료.", body: nil, date: Date()),
    Data(type: "대여 / 반납", header: "시간", title: "물막이 반난 시간이 10분 남았습니다.", body: nil, date: Date())
]
