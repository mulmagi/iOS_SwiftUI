//
//  QRScanBtn.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/29.
//

import SwiftUI

struct QRScanBtn: View {
    var body: some View {
        NavigationLink(destination: ContentView()) {
            HStack {
                Image("scan")
                
                VStack {
                    Text("대여하기")
                        .font(.medium10)
                        .foregroundColor(.white)
                        .padding(.bottom, 1)
                    Text("QR스캔")
                        .font(.bold15)
                        .foregroundColor(.white)
                }
            }
            .padding(EdgeInsets(top: 17, leading: 24, bottom: 19, trailing: 29))
            .background(Color.darkNavy)
            .cornerRadius(20)
        }

    }
}

struct QRScanBtn_Previews: PreviewProvider {
    static var previews: some View {
        QRScanBtn()
    }
}
