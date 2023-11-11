//
//  MenuView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

struct MenuView: View {
    let items = ["이용내역", "고객센터", "이용안내", "고객안내"]
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                Spacer(minLength: 30)
                
                UserBoxView()
                
                Spacer(minLength: 30)
                
                VStack {
                    PointView()
                    Spacer(minLength: 30)
                    
                    // Buttons
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 30), GridItem(.flexible(), spacing: 30)
                    ], alignment: .center, spacing: 15) {
                        ForEach (items, id:\.self) { item in
                            MenuButton(menuName: item)
                                .frame(height: 134)
                        }
                    }
                    
                    Spacer(minLength: 15)
                }
                .padding(.horizontal, 25)
                
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            
            .background(Color.backgroundBlue)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
