//
//  MulmagiView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/17.
//

import SwiftUI
import MapKit

struct MulmagiView: View {
    // MKCoordinationRegion: 지도 중앙
    // CLLocationCoordinate2D로 지도 중앙 좌표 지정.
    
    // MKCoordinateSpan: 지도 중앙으로부터 얼마나 화면에 표시할지 지정.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5094195, longitude: 127.0031263),
        span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
    )
    @State var tracking: MapUserTrackingMode = .follow
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking)
                .accentColor(.blue)
                .onAppear {
                    let manager = CLLocationManager()
                    manager.requestWhenInUseAuthorization()
                    manager.startUpdatingLocation()
                }
            // interactionMode: .all - panning, zoom 모두 허용.
                .onChange(of: locationManager.location) { newLocation in
                    if let coordinate = newLocation?.coordinate {
                        region.center = coordinate
                    }
                }
        }
        .ignoresSafeArea()
    }
}

struct MulmagiView_Previews: PreviewProvider {
    static var previews: some View {
        MulmagiView()
    }
}

// 비둘기놀이터: 37.5094195, 127.0031263
//
