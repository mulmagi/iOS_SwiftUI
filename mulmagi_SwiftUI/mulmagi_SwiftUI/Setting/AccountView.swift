//
//  AccountView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/10.
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("버전 정보")
                    Spacer()
                    Text(appVersion())
                }
            }
        }
    }
}

func appVersion() -> String {
    guard let dictionary = Bundle.main.infoDictionary,
          let version = dictionary["CFBundleShortVersionString"] as? String else {return "버전 정보를 가져올 수 없음."}
    
    let versionAndBuild: String = "ver \(version)"
    return versionAndBuild
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

