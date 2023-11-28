//
//  UmbrellaStandModel.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/28.
//

import CoreLocation

struct UmbrellaStand: Identifiable {
    let id: Int
    let location: CLLocationCoordinate2D
    let total: Int
    let available: [Int]
}

