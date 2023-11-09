//
//  MenuView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack (alignment: .center) {
            Spacer(minLength: 31)
            
            UserBoxView()
            
            Spacer(minLength: 32)
            
            
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
