//
//  mulmagi_SwiftUIApp.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

@main
struct mulmagi_SwiftUIApp: App {
    @StateObject var user = User(state: "null", point: "1, 000", needCharge: true, restPoint: "-  9, 000", didCharge: false)

    var body: some Scene {
        WindowGroup {
            FirstView()
//            MainTabbedView()
//            RentCheckView()
                .environmentObject(user)
        }
    }
}
