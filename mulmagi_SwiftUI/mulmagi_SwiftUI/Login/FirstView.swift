//
//  FirstView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/10.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundBlue
                
                VStack(alignment: .center) {
                    VStack {
                        Text("갑자기 비가 오는데,")
                        Text("우산이 없으신 당신에게!")
                    }
                    .font(.bold20)
                    .padding(.bottom, 30)
                    .padding(.top, 300)
                    .foregroundColor(.darkNavy)
                    
                    Image("Logo")
                        
                    Spacer()
                    
                    NavigationLink(destination: NameView()) {
                        Text("시작하기")
                            .frame(maxWidth: .infinity)
                            .font(.medium17)
                            .foregroundColor(.mainBlue)
                            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.mainBlue, lineWidth: 1)
                            )
                    }
                    .padding(.bottom, 100)
                }
                .padding(.horizontal, 20)
            }
            
            .ignoresSafeArea()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
