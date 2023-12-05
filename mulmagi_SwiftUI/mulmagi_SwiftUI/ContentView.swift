//
//  ContentView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundBlue
                VStack(spacing: 30) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                    
                    VStack {
                        Text("This is Content View").font(.bold15)
                        Text("This is Content View").font(.medium15)
                        Text("This is Content View").font(.medium10)
                        Text("This is Content View").font(.light10)
                    }
                    
                    NavigationLink(destination: NameView()) {
                        Text("회원가입 로그인")
                            .font(.bold20)
                            .foregroundColor(.mainBlue)
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
            .navigationBarTitle("화면", displayMode: .inline)
            .navigationBarBackButtonHidden(false) // 뒤로 가기 버튼 표시
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.darkNavy)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
