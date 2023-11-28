//
//  TabView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case menu = 0
    case mulmagi
    case alarm
    
    var title: String {
        switch self {
        case .menu:
            return "메뉴"
        case .mulmagi:
            return "물막이"
        case .alarm:
            return "알림"
        }
    }
    
    var iconName: String {
        switch self {
        case .menu:
            return "menu-icon"
        case .mulmagi:
            return "umbrella-icon"
        case .alarm:
            return "alarm-icon"
        }
    }
}

struct MainTabbedView: View {
    @State var selectedTab = 0
    
    var body: some View {
            
            ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    MenuView() // MenuView
                        .tag(0)
                        .padding(.horizontal, 25)
                    // TODO: MenuView 내부의 padding 안되는 이유 찾기.

                    MulmagiView() // MulmagiView
                        .tag(1)

                    NotificationView() // NotificationView
                        .tag(2)

                }

                ZStack {
                    HStack {
                        ForEach((TabbedItems.allCases), id: \.self){ item in
                            Button{
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                            
                            if item != TabbedItems.allCases.last {
                                Spacer(minLength: 25)
                            }
                        }
                        
                    }
                    .padding(45) // Hstack과 화면사이 거리
                }
                .frame(height: 74)
                .background(.white)
                .cornerRadius(25)
                .padding(.horizontal, 50)
            }
        }
    }

extension MainTabbedView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 12){ // icon - name space
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .mainBlue : .darkNavy)
                .frame(width: 26, height: 26)
            
            if isActive {
                Text(title)
                    .font(.medium17)
                    .foregroundColor(isActive ? .mainBlue : .darkNavy)
            }
            
            Spacer()
        }
//        .padding(EdgeInsets(top: 16, leading: isActive ? 30 : 0, bottom: 16, trailing: isActive ? 30 : 0))
        .frame(width: isActive ? 153 : 26, height: 52)
        .background(isActive ? Color.lightBlue : .clear)
        .cornerRadius(72)
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
    }
}
