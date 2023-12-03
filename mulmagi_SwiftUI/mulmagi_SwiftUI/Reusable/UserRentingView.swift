//
//  UserRentingView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/04.
//

import SwiftUI

struct UserRentingView: View {
    @State var userState = "overdue"
    @State private var date: Date = Date() // TODO: Api로 가져오기
    @State private var overdueAmount = "1, 000"

    private func formatDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yy. MM. dd"
            return formatter.string(from: date)
        }
    
    private func calculateDays(from startDate: Date) -> Int {
            let calendar = Calendar.current
            let currentDate = Date()
            let components = calendar.dateComponents([.day], from: startDate, to: currentDate)
            if let days = components.day {
                return days + 1
            } else {
                return 0
            }
        }
    
    private func calculateDday(from startDate: Date) -> String {
            let calendar = Calendar.current
            let currentDate = Date()
            let components = calendar.dateComponents([.day], from: startDate, to: currentDate)
            
            if let days = components.day {
                if days < 0 {
                    return "D + \(abs(days))"
                } else if days > 7 {
                    return "D + \(days - 7)"
                } else if days == 7 {
                    return "D-Day"
                } else {
                    return "D - \(7 - days)"
                }
            } else {
                return ""
            }
        }
    
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
                        Text("\(calculateDays(from: date))일차")
                            .font(.medium17)
                        
                        Text("\(formatDate(date)) -")
                            .font(.medium10)
                    }
                    
                    Text("\(calculateDday(from: date))")
                        .font(.bold20)
                        .foregroundColor(.lightYellow)
                }
            }
            
            NavigationLink {
                ScanView()
            } label: {
                VStack {
                    Image("scan")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("반납하기")
                        .font(.light10)
                }
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
