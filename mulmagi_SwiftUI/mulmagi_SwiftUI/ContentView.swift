//
//  ContentView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundBlue
            VStack {
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
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
