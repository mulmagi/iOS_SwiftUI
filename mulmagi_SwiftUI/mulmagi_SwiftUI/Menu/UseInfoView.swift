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
            .navigationTitle("이용안내")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: BackButton())
            .navigationBarBackButtonHidden(true)
            
            .navigationBarTitle("이용안내", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
        }
    }
}

struct UseInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UseInfoView()
    }
}
