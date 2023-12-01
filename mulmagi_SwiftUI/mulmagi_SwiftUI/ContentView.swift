//
//  ContentView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
