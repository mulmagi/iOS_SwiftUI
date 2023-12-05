//
//  NotificationView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/14.
//

import SwiftUI

struct NotificationView: View {
    
    @State var selectedType = "전체"
    var types = ["전체", "대여 / 반납", "포인트", "기타"]
    @State var isAlarm: Bool = true
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 18)
                // SegmentedView
                Picker("Type", selection: $selectedType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                            .font(.medium15)
                    }
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 20)
                
                InsetGroupedListView(selectedType: $selectedType)                
                
                Spacer()
                
            }
            .navigationBarTitle("알림", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.isAlarm.toggle()
            }, label: {
                Image(isAlarm ? "alarm-icon" : "alarm-off")
                    .frame(width: 27, height: 22, alignment: .leading)
                    .foregroundColor(.darkNavy)
                    .padding(.trailing, 15)
            }))
            
            .background(Color.backgroundBlue)
        }
    }
}


struct NotificationVIew_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
