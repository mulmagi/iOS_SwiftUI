//
//  UserView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

struct UserBoxView: View {
    var body: some View {
        ZStack {
            HStack (spacing: 23) { // Image + Text
                // TODO: User Profile 가져오기
                VStack (alignment: .leading) {
                    Image(systemName: "person")
                        .frame(width: 77, height: 80)
                }
                Divider()
                    .background(.white)
                    .frame(width: 1, height: 87)
                
                VStack (alignment: .leading, spacing: 6) {
                    
                    Spacer() 
                    Text("BABY 물막이 72/100")
                        .font(.light10)
                        .padding(.bottom, 3)
                        
                    Text("최은지")
                        .font(.medium17)
                        .padding(.bottom, 5)
                    
//                    Spacer()
                    HStack (alignment: .center, spacing: 4) {
                        // TODO: Change phone icon Image
                        Image(systemName: "phone")
                        
                        Text("010-8701-7153")
                            .font(.medium10)
                    }
                    
                }
                .foregroundColor(.white)
            }
        }
//        .frame(width: 315, height: 116)
        .padding(EdgeInsets(top: 13, leading: 23, bottom: 13, trailing: 65))
        .background(Color.mainBlue)
        .cornerRadius(20)
    }
}

struct UserBoxView_Previews: PreviewProvider {
    static var previews: some View {
        UserBoxView()
    }
}
