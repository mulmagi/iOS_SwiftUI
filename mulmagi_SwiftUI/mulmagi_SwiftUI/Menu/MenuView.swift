//
//  MenuView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

struct MenuView: View {
    let items = ["이용내역", "고객센터", "이용안내", "계정설정"]
    
    var body: some View {
        NavigationView {
            
            VStack (alignment: .center) {
                Spacer(minLength: 80)
                
                UserBoxView()
                    .padding(.horizontal, 38)
                
                Spacer(minLength: 30)
                
                VStack {
                    PointView()
                    Spacer(minLength: 18)
                        .padding(.bottom, 18)
                    
                    // Buttons
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 30), GridItem(.flexible(), spacing: 30)
                    ], alignment: .center, spacing: 15) {
                        ForEach (items, id:\.self) { item in
                            MenuButton(menuName: item)
                                .frame(height: 134)
                        }
                    }
                    
                    Spacer(minLength: 30)
                    
                    NoticeButton()
                }
                .padding(.horizontal, 25)
                
                Spacer(minLength: 125)
            }
            .background(Color.backgroundBlue)
        }
        .ignoresSafeArea()
    }
        
        
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
