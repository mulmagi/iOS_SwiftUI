//
//  TOSView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/10.
//

import SwiftUI

struct TOSView: View {
    var body: some View {
        NavigationView {
            VStack {
                WhiteBoxView(menuName: "이용약관")
                    .padding(.horizontal, 12)
                    .padding(.top, 25)
                Spacer()
            }
            .background(Color.backgroundBlue)
            
        }
        .navigationTitle("이용약관")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: BackButton())
        .navigationBarBackButtonHidden(true)
    
    }
}

struct TOSView_Previews: PreviewProvider {
    static var previews: some View {
        TOSView()
    }
}
