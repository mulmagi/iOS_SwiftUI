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
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    @State var tracking: MapUserTrackingMode = .follow
    @ObservedObject private var locationManager = LocationManager()
    
    @State private var umbrellaStands: [UmbrellaStand] = []
    
    @State var selectedStand: UmbrellaStand?
    @State private var isStandInfoViewVisible: Bool = false
    @EnvironmentObject var user: User
    @State private var tapLocation: CGPoint? = nil

//    @StateObject var user = User(state: "null", point: "1, 000", needCharge: true, restPoint: "- 10, 000")

//    @State var userState: String = "null"
    // null / overdue / renting
    

    
    var body: some View {
        NavigationView {
            
            ZStack {
                // interactionMode: .all - panning, zoom 모두 허용.
                
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: umbrellaStands) { stand in
                    MapAnnotation(coordinate: stand.location) {
                        Button {
                            // TODO: StandInfo 통째로 넘겨주기
                            selectedStand = stand
                            isStandInfoViewVisible = true
                            print(stand.name)
                            
                        } label: {
                            if stand.available.count == 0 {
                                Image("umbrella-none")
                            } else {
                                Image("umbrella-exist")
                            }
                        }
                    }

                }
                .onTapGesture {
                    print("umbrella touched")
                    isStandInfoViewVisible = true
                }
                .highPriorityGesture(TapGesture())
                .accentColor(.blue)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if let userLocation = locationManager.location?.coordinate {
                            region.center = userLocation
                        }
                        
                        let manager = CLLocationManager()
                        manager.requestWhenInUseAuthorization()
                        manager.startUpdatingLocation()
                        loadUmbrellaStands()
                    }
                }
                .ignoresSafeArea()
                


                // Top QRScan Btn
                VStack {
                    QRScanBtn()
                        .padding(.top, 10)
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            if let location = locationManager.location {
                                region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
                            }
                        } label: {
                            Image("current-location")
                                .foregroundColor(.pink)
                                .font(.system(size: 50))
                                .frame(width: 42, height: 42)
                        }
                        .padding(.bottom, 118)
                        .padding(.trailing, 26)
                    }
                }
                // UmbrellaStand View
                VStack {
                    Spacer()
                    
                    if isStandInfoViewVisible && user.state == "null" {
                        StandInfoView(standInfo: $selectedStand)
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 40)
                    } else {
                        if user.state != "null" {
                            UserRentingView(userState: user.state)
                                .cornerRadius(20)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 40)
                        }
                    }
                }
//                .interactiveDismissDisabled(true)
            }
        
        }
//        .onTapGesture {
//            print("OK")
//            isStandInfoViewVisible = false
//        }
//        .interactiveDismissDisabled(true)
        
        
    }
                
    private func loadUmbrellaStands() {
        umbrellaStands = [
            UmbrellaStand(id: 1, location: CLLocationCoordinate2D(latitude: 37.5094195, longitude: 127.0031263), name: "비둘기 공원", total: 10, available: [1, 3, 4, 12]),
            UmbrellaStand(id: 2, location: CLLocationCoordinate2D(latitude: 37.5016116, longitude: 127.0047678), name: "가톨릭대학교 서울성모병원", total: 10, available: [])
        ]
    }
    
    func hitTest(_ location: CGPoint) -> Bool {
        // Implement hit testing logic based on the position of the umbrella image
        // Return true if the tap is within the bounds of the umbrella image, otherwise return false
        // You may need to calculate the position of the umbrella image within the coordinate space of the map
        return false
    }
}

struct MulmagiView_Previews: PreviewProvider {
    static var previews: some View {
        MulmagiView()
    }
}

// 비둘기놀이터: 37.5094195, 127.0031263
//
