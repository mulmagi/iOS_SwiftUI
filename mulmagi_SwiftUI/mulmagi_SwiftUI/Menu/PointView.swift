//
//  PointView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/09.
//

import SwiftUI

struct PointView: View {
    @State private var isChargeSheetPresent: Bool = false
    @State private var moveToPointInfoView: Bool = false
    
    var body: some View {
        
        Button {
            moveToPointInfoView.toggle()
        } label: {
            HStack {
                VStack (alignment: .leading) {
                    HStack (spacing: 7) {
                        Text("포인트")
                        Text("|")
                        // TODO: API - User Point
                        Text("3,000 점");
                    }
                    .foregroundColor(.darkNavy)
                    .font(.medium15)
                    .padding(.bottom, 5)
                    
                    Text("물막이 이용을 위해 포인트를 충전해주세요.")
                        .font(.medium10)
                        .foregroundColor(.lineGray)
                }
                Spacer()
                
                
                Button {
                    isChargeSheetPresent.toggle()
                } label: {
                    Text("충전하기")
                        .font((.medium15))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 7, leading: 4.5, bottom: 7, trailing: 4.5))
                }
                .buttonStyle(.bordered)
                .background(Color.mainBlue)
                .cornerRadius(10)
                
                .fullScreenCover(isPresented: $isChargeSheetPresent) {
                    PointChargeView()
                }
                
            }
            .padding(EdgeInsets(top: 19, leading: 25, bottom: 15, trailing: 27))
            .background(.white)
            .cornerRadius(15)
        }
        .fullScreenCover(isPresented: $moveToPointInfoView) {
            ContentView()
        }
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}
