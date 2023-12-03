//
//  UserRentingView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/04.
//

import SwiftUI

struct UserRentingView: View {
    @State var userState = "overdue"
    @State private var date = "22. 07. 28"
    @State private var overdueAmount = "1, 000"

    var body: some View {
        HStack (spacing: 35) {
            VStack (alignment: .leading, spacing: 5) {
                HStack (alignment: .center, spacing: 12) {
                    Text(userState == "overdue" ? "연체중" : "대여중")
                        .font(.bold17)
                    if userState == "overdue" {
                        Text("+ \(overdueAmount) P")
                            .font(.medium10)
                            .foregroundColor(.lightYellow)
                    }
                }
                
                Divider()
                    .background(.white)
                    .frame(height: 0.5)
                    .padding(.bottom, 10)
                
                
                HStack (spacing: 30) {
                    Image("umbrella-circle")
                    
                    VStack (alignment: .leading, spacing: 7) {
                        Text("8일차")
                            .font(.medium17)
                        
                        Text("\(date) -")
                            .font(.medium10)
                    }
                    
                    Text("D +1")
                        .font(.bold20)
                        .foregroundColor(.lightYellow)
                }
            }
            
            VStack {
                Image("scan")
                    .resizable()
                    .frame(width: 50, height: 50)
                    
                Text("반납하기")
                    .font(.light10)
            }
        }
        .padding(EdgeInsets(top: 19, leading: 25, bottom: 12, trailing: 25))
        .background(Color.darkNavy)
        .foregroundColor(.white)
    }
}

struct UserRentingView_Previews: PreviewProvider {
    static var previews: some View {
        UserRentingView()
    }
}
