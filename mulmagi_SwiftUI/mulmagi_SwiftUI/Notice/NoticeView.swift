//
//  NoticeView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/14.
//

import SwiftUI

struct NoticeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selectedType = "공지사항"

    var body: some View {
        NavigationView {
            InsetGroupedListView(selectedType: $selectedType)
                .navigationBarTitle("공지사항", displayMode: .inline)
                .navigationBarBackButtonHidden(false) // 뒤로 가기 버튼 표시
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.darkNavy)
                        }
                    }
                }
        }
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
