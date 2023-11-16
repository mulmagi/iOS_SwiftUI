//
//  NoticeDetailView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/16.
//

import SwiftUI

struct NoticeDetailView: View {
    var body: some View {
        NavigationView {
            VStack {
                WhiteBoxView(menuName: "공지사항화면")
                    .padding(.horizontal, 12)
                    .padding(.top, 25)
            }
            .background(Color.backgroundBlue)
        }
        .navigationTitle("공지사항")
        .font(.system(size: 17, weight: .semibold))
    }
}

struct NoticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeDetailView()
    }
}
