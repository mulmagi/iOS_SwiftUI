//
//  MenuButton.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/09.
//

import SwiftUI

struct MenuButton: View {
    let menuName: String
    
    var body: some View {
        GeometryReader { geometry in
            NavigationLink (destination: ContentView()) {
                VStack (alignment: .leading) {
                    Image("alarm-icon")
                        .frame(width:60, height: 60)
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom, 15)
                        .padding(.top, 17)
                    
                    HStack (alignment: .bottom) {
                        Text(menuName)
                            .font(.medium15)
                            .foregroundColor(.darkNavy)
                            .padding(.leading, 25)
                        
                        if let menuInfo = menuInfoText(menuName: menuName) {
                            Text(menuInfo)
                                .font(.light10)
                                .foregroundColor(.darkGray)
                                .padding(.trailing, 20)
                        } else {
                            Spacer()
                        }
                        Spacer()
                    }
                    .frame(width: geometry.size.width)
                    .padding(.bottom, 18)
                    
                }
                .background(.white)
                .cornerRadius(15)
            }
            
        }
    }
}

private func menuInfoText(menuName: String) -> String? {
    switch menuName {
    case "이용내역":
        return "13"
    case "고객센터":
        return "1:1 채팅"
    default:
        return nil
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(menuName: "이용내역")
    }
}
