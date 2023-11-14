//
//  UseInfoView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/11.
//

import SwiftUI

struct UseInfoView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                WhiteBoxView(menuName: "이용안내")
                    .padding(.horizontal, 12)
                    .padding(.top, 25)
                Spacer()
            }.background(Color.backgroundBlue)
        }
        .navigationTitle("이용안내")
        .font(.system(size: 17, weight: .semibold))
    }
}

struct UseInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UseInfoView()
    }
}
