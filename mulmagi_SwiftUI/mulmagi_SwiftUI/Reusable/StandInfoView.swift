//
//  StandInfoView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/03.
//

import SwiftUI
import MapKit

struct StandInfoView: View {
    @Binding var standInfo: UmbrellaStand?
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 5) {
            Text(standInfo!.name)
                .font(.bold17)
            
            Divider()
                .background(.white)
                .frame(height: 0.5)
                .padding(.bottom, 10)
            
            
            HStack (spacing: 30) {
                Image("umbrella-circle")
                
                VStack (alignment: .leading, spacing: 5) {
                    HStack (spacing: 12) {
                        Text("대여 가능")
                        Text("|")
                        Text("\(standInfo!.available.count) 개 / \(standInfo!.total) 개" )
                    }
                    .font(.medium15)
                    
                    Text(standInfo!.available.map { String($0) }.joined(separator: " / ") + " (번)")
                        .font(.light10)
                }
            }
        }
        .padding(EdgeInsets(top: 19, leading: 25, bottom: 12, trailing: 25))
        .background(Color.mainBlue)
        .foregroundColor(.white)
    }
}

struct StandInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StandInfoView(standInfo: .constant(UmbrellaStand(id: 1, location: CLLocationCoordinate2D(latitude: 37.5094195, longitude: 127.0031263), name: "비둘기 공원", total: 10, available: [1, 3, 4, 12])))
    }
}
