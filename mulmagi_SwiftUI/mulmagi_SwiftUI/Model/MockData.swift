//
//  MockData.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/18.
//

import SwiftUI

//class UserState: ObservableObject {
//    @Published var userState: String = "null"
//    @Published var needCharge: Bool = true
//    @Published var userPoint: String = "1, 000"
//    @Published var restPoint: String = "- 10, 000"
//}

class User: ObservableObject {
    @Published var state: String
    @Published var point: String
    @Published var needCharge: Bool
    @Published var restPoint: String
    @Published var didCharge: Bool
    
    init(state: String, point: String, needCharge: Bool, restPoint: String, didCharge: Bool) {
        self.state = state
        self.point = point
        self.needCharge = needCharge
        self.restPoint = restPoint
        self.didCharge = didCharge
    }
}

func mockUser() -> User {
    return User(state: "null", point: "1, 000", needCharge: true, restPoint: "- 9, 000", didCharge: false)
}
