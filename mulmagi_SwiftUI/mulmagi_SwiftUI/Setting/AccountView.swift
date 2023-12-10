//
//  AccountView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/10.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var showLogoutAlert: Bool = false
    @State var showWidthdrawAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Text("버전 정보")
                            .font(.medium15)
                        Spacer()
                        Text(appVersion())
                            .font(.light13)
                    }
                    
                    NavigationLink(destination: TOSView()) {
                        Text("이용약관")
                    }
                        .font(.medium15)
                    
                    Section(header: Text("계정")) {
                        NavigationLink("전화번호 수정", destination: TOSView())
                        Text("로그아웃")
                            .onTapGesture {
                                showLogoutAlert = true
                            }
                            .alert(isPresented: $showLogoutAlert) {
                                let logoutButton = Alert.Button.default(Text("로그아웃")) {
                                    // TODO: Logout API
                                }
                                
                                return Alert(title: Text("로그아웃"),
                                      message: Text("로그아웃 하시겠습니까?."),
                                      primaryButton: logoutButton,
                                      secondaryButton: .cancel(Text("취소")))
                            }
                        
                        Text("회원탈퇴")
                            .onTapGesture {
                                showWidthdrawAlert = true
                            }
                            .alert (isPresented: $showWidthdrawAlert) {
                                let withdrawButton = Alert.Button.default(Text("회원탈퇴")) {
                                    // TODO: withdraw API
                                }
                                
                                return Alert(title: Text("회원탈퇴"),
                                             message: Text("탈퇴 하시겠습니까?"),
                                             primaryButton: withdrawButton,
                                             secondaryButton: .cancel(Text("취소")))
                            }
                    }
                }
                .padding(.bottom, 32)
                .listStyle(InsetGroupedListStyle())
            }
            .navigationBarTitle("설정", displayMode: .inline)
            .navigationBarBackButtonHidden(false) // 뒤로 가기 버튼 표시
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.darkNavy)
                    }
                }
            }
        }
        .foregroundColor(.darkNavy)
            
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

