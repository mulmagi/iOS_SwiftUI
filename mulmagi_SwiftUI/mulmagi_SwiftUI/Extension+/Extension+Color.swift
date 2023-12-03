//
//  Extension+Color.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    static let backgroundBlue = Color(hex: "EEF1FB")
    static let lightBlue = Color(hex: "D6E3FB")
    static let mainBlue = Color(hex: "4D7FEF")
    static let darkNavy = Color(hex: "283255")
    static let lightYellow = Color(hex: "FCD770")
    
    static let darkGray = Color(hex: "555555")
    static let midGray = Color(hex: "929292")
    static let lightGray = Color(hex: "DFDFDF")
    static let lineGray = Color(hex: "AFB1B9")
    
}
