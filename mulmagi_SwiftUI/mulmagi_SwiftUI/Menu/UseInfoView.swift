//
//  UseInfoView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/11.
//

import SwiftUI

struct UseInfoView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                WhiteBoxView(menuName: "이용안내")
                    .padding(.horizontal, 12)
                    .padding(.top, 25)
                Spacer()
            }
            .background(Color.backgroundBlue)
            .navigationBarTitle("이용안내", displayMode: .inline)
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

struct UseInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UseInfoView()
    }
}
