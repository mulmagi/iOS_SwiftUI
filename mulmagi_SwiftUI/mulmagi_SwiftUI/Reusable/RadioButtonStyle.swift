//
//  RadioButtonView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/05.
//

import SwiftUI

struct RadioButtonStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
                .imageScale(.medium)
                .foregroundColor(configuration.isOn ? .blue : .gray)
            
            configuration.label
        }
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}
