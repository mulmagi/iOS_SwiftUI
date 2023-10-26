//
//  Extension+Font.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/10/26.
//

import SwiftUI

extension Font {
    enum GmarketSans {
        case bold
        case medium
        case light
        case custom(String)
        
        // Usage: .font(.poppins(.medium))
        var value: String {
            switch self {
            case .bold:
                return "GmarketSansTTFBold"
            case .medium:
                return "GmarketSansTTFMedium"
            case .light:
                return "GmarketSansTTFLight"
            case .custom(let name):
                return name
            }
        }
    }

    // Usage: .font(.gmarket(.semibold, size: 50))
    static func gmarket(_ type: GmarketSans, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
    
    // Usage: .font(.bold20)
    // bold
    static let bold20: Font = .custom("GmarketSansTTFBold", size: 20)
    static let bold17: Font = .custom("GmarketSansTTFBold", size: 17)
    static let bold15: Font = .custom("GmarketSansTTFBold", size: 15)
    
    // medium
    static let medium17: Font = .custom("GmarketSansTTFMedium", size: 17)
    static let medium15: Font = .custom("GmarketSansTTFMedium", size: 15)
    static let medium10: Font = .custom("GmarketSansTTFMedium", size: 10)
    
    // light
    static let light13: Font = .custom("GmarketSansTTFLight", size: 13)
    static let light10: Font = .custom("GmarketSansTTFLight", size: 10)

}
