//
//  BackButton.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/10.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.darkNavy)
        }
    }
}
