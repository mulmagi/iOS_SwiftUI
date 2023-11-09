//
//  PointView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/09.
//

import SwiftUI

struct PointView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView()) {
                HStack () {
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
                    
                    Button(action: {
                        // TODO: Move to Charge View
                        print("Charge button tapped")
                    }) {
                        Text("충전하기")
                            .padding(EdgeInsets(top: 7, leading: 4, bottom: 7, trailing: 4))
                            .font(.medium15)
                            .background(Color.mainBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(EdgeInsets(top: 19, leading: 25, bottom: 11, trailing: 27))
                .background(Color.backgroundBlue)

                .cornerRadius(15)
            }
        }
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}
