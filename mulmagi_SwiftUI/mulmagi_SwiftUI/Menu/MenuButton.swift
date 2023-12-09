//
//  MenuButton.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/09.
//

import SwiftUI

struct MenuButton: View {
    let menuName: String
    @Environment(\.presentationMode) var presentationMode

    @State private var isSelected: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                isSelected = true
            }, label: {
                VStack (alignment: .leading) {
                    Image(destinationIcon(menuName: menuName))
                        .frame(width:60, height: 60)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 15)
                        .padding(.top, 17)
                        .padding(.leading, 20)
                    
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
                //            }
            })
                
            .fullScreenCover(isPresented: $isSelected) {
                destinationView(menuName: menuName)
            }
            
        }
    }
}
private func destinationView(menuName: String) -> AnyView {
    switch menuName {
    case "이용내역":
        return AnyView(UsageView())
    case "고객센터":
        return AnyView(ChatView())
    case "이용안내":
        return AnyView(UseInfoView())
    case "계정설정":
        return AnyView(ContentView())
    default:
        return AnyView(ContentView())
    }
}

private func destinationIcon(menuName: String) -> String {
    switch menuName {
    case "이용내역":
        return "usage"
    case "고객센터":
        return "chat"
    case "이용안내":
        return "useInfo"
    case "계정설정":
        return "setting"
    default:
        return "usage"
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
