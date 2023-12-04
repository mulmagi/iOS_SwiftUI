//
//  UsageView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/05.
//

import SwiftUI

struct UsageView: View {
    @Environment(\.presentationMode) var presentationMode

    
    @State private var usageData = [
        Usage(usedPoint: 2000, experiment: 20, time: "1시간 12분", borrowPlace: "경희대학교 전자정보대학 7번", returnPlace: "경희대학교 정문 1번", borrowDate: "2023. 01. 19", returnDate: "2023. 09. 19"),
        Usage(usedPoint: 5000, experiment: 50, time: "2시간 09분", borrowPlace: "가톨릭대학교 성모병원 7번", returnPlace: "가톨릭대학교 성모병원 1번", borrowDate: "2023. 01. 19", returnDate: "2023. 09. 19"),
        Usage(usedPoint: 1000, experiment: 10, time: "1시간 12분", borrowPlace: "경희대학교 정문 7번", returnPlace: "강남역 1번 출구 1번", borrowDate: "2023. 01. 19", returnDate: "2023. 09. 19"),
        Usage(usedPoint: 2000, experiment: 20, time: "1시간 12분", borrowPlace: "경희대학교 전자정보대학 7번", returnPlace: "경희대학교 정문 1번", borrowDate: "2023. 01. 19", returnDate: "2023. 09. 19"),
        Usage(usedPoint: 5000, experiment: 50, time: "2시간 09분", borrowPlace: "가톨릭대학교 성모병원 7번", returnPlace: "가톨릭대학교 성모병원 1번", borrowDate: "2023. 01. 19", returnDate: "2023. 09. 19"),
        Usage(usedPoint: 1000, experiment: 10, time: "1시간 12분", borrowPlace: "경희대학교 정문 7번", returnPlace: "강남역 1번 출구 1번", borrowDate: "2023. 01. 19", returnDate: "2023. 09. 19")
    ]
    var body: some View {
        
        NavigationView {
            
            VStack {
                List {
                    ForEach(0..<usageData.count, id: \.self) { index in
                        Section {
                            DisclosureGroup {
                                VStack (alignment: .leading, spacing: 13) {
                                    VStack (alignment: .leading, spacing: 5) {
                                        HStack (spacing: 5) {
                                            Text("[대여]")
                                                .font(.medium15)
                                                .foregroundColor(.darkNavy)
                                            Text("23:00:19")
                                                .font(.light10)
                                                .foregroundColor(.darkNavy)
                                        }
                                        Text("가톨릭대학교 성모병원 7번")
                                            .font(.light13)
                                    }
                                    .padding(.top, 17)
                                    
                                    VStack (alignment: .leading, spacing: 5) {
                                        HStack (spacing: 5) {
                                            Text("[반납]")
                                                .font(.medium15)
                                                .foregroundColor(.darkNavy)
                                            Text("23:00:19")
                                                .font(.light10)
                                                .foregroundColor(.darkNavy)
                                        }
                                        Text("가톨릭대학교 성모병원 7번")
                                            .font(.light13)
                                    }
                                }
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                                .padding(.leading, -12)
                                
                            } label: {
                                HStack (alignment: .center) {
                                    VStack (alignment: .leading, spacing: 10) {
                                        Text("2023. 07. 28 오후 1시 32분")
                                            .font(.medium10)
                                            .foregroundColor(.darkNavy)
                                        Text("1시간 12분")
                                            .font(.medium15)
                                    }
                                    Spacer()
                                    
                                    VStack (alignment: .trailing, spacing: 6) {
                                        Text("- 2, 000 포인트")
                                            .font(.medium15)
                                            .foregroundColor(.mainBlue)
                                        Text("+ EXP10")
                                            .font(.light10)
                                            .foregroundColor(.darkNavy)
                                    }
                                }
                                .padding(EdgeInsets(top: 13, leading: 10, bottom: 10, trailing: 10))
                                
                            }
                        }
                    }
                }
                
                .listStyle(.insetGrouped)
                
            }
            .navigationBarTitle("이용내역", displayMode: .inline)
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
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        UsageView()
    }
}

struct Usage {
    var usedPoint: Int
    var experiment: Int
    var time: String
    var borrowPlace: String
    var returnPlace: String
    var borrowDate: String
    var returnDate: String
}
