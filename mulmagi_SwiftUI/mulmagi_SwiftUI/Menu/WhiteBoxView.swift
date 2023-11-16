//
//  WhiteBoxView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/11.
//

import SwiftUI

struct WhiteBoxView: View {
    var menuName: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if titleText(menuName: menuName) {
                    VStack (alignment: .leading) {
                        HStack {
                            Text("[공지]")
                                .foregroundColor(.mainBlue)
                                .padding(.trailing, 10)
                            
                            // TODO: API로 제목 가져오기
                            Text("오류로 인한 포인트 일괄 지급")
                                .foregroundColor(.black)
                            
                        }
                        .font(.medium15)
                        .padding(.bottom, 1)
                        
                        Text("2023. 07. 28")
                            .font(.light10)
                            .foregroundColor(.midGray)
                            .padding(.bottom, 2)
                    }
                    
                    Divider()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                }
                
                Text("오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 오류로 인한 포인트 일괄 지급 안내 오류로 인한 포인트 일괄 지급 안내")
                    .font(.light13)
                    .foregroundColor(.black)
                    .tracking(-0.41)
                    .lineSpacing(7)
                
            }
            .padding(EdgeInsets(top: 15, leading: 18, bottom: 15, trailing: 18))
            .background(.white)
            .cornerRadius(14)
        }
    }
}

private func titleText(menuName: String) -> Bool {
    switch menuName {
    case "공지사항", "공지사항화면":
        return true
    default:
        return false
    }
}

struct WhiteBoxView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteBoxView(menuName: "공지사항")
    }
}
