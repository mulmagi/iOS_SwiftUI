//
//  PointInfoView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/10.
//

import SwiftUI

struct PointInfoView: View {
    @State private var data = pointHistoryData
    let size: Double = UIScreen.main.bounds.width/3.0
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Divider()
                    .frame(height: 0.5)
                    .background(Color.darkGray)

                
                HStack {
                    Text("포인트")
                        .frame(maxWidth: size, alignment: .center)
                    Spacer()
                    Text("적립 구분")
                        .frame(maxWidth: size, alignment: .center)
                    Spacer()
                    Text("날짜")
                        .frame(maxWidth: size, alignment: .center)
                }
                .padding(.vertical, 10)
                .font(.medium15)
                
                Divider()
                    .frame(height: 0.8)
                    .background(Color.darkGray)

                List {
                    Section() {
                        
                    }
                    
                    ForEach (data) { history in
                        ListCell(history: history)
                    }
                }
                .listStyle(.plain)
                .frame(width: .infinity, height: nil, alignment: .center)
            }
            .foregroundColor(.darkNavy)
            .padding(.horizontal, 28)
        }
    }
}

struct PointInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PointInfoView()
    }
}


struct ListCell: View {
    let size: Double = UIScreen.main.bounds.width/3.0
    var history: PointHistory

    var body: some View {
        HStack(alignment: .center, spacing: nil) {
                Text(history.amount)
                .frame(maxWidth: size, alignment: .leading)
                Text(history.transactionType)
                .frame(maxWidth: size, alignment: .center)
                Text(history.date.formatDate(history.date))
                .frame(maxWidth: size, alignment: .trailing)
        }
        .padding(.vertical, 8)
        .font(.light13)
        .foregroundColor(.darkNavy)
    }
}
