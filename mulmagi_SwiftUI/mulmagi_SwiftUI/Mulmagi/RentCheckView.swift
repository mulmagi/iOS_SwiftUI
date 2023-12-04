//
//  RentCheckView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/04.
//

import SwiftUI
struct RentCheckView: View {
    @State var rentPlace: String = "가톨릭대학교 성모병원 2"
    @State var rentalDate: String = "2023-11-06T00:00:00"
    @State private var needCharge: Bool = false
    @State private var needAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 20) {
                Text("대여하시겠습니까?")
                    .font(.medium17)
                    .foregroundColor(.darkNavy)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                
                VStack (alignment: .leading, spacing: 4) {
                    Text("예상 이용 내역")
                        .font(.light10)
                        .foregroundColor(.midGray)
                        .padding(.bottom, 7)
                        .padding(.leading, 12)
                    
                    VStack (alignment: .leading, spacing: 7) {
                        HStack (alignment: .center, spacing: 25) {
                            Text("대여 장소")
                                .font(.medium10)
                                .foregroundColor(.darkNavy)
                            Text("12:00:19")
                                .font(.light10)
                                .foregroundColor(.midGray)
                        }
                        Text("\(rentPlace)번")
                            .font(.light13)
                            .foregroundColor(.black)
                            .padding(.bottom, 15)
                        
                        VStack (alignment: .leading, spacing: 7) {
                            HStack (alignment: .center, spacing: 25) {
                                Text("기본 대여일")
                                    .font(.medium10)
                                    .foregroundColor(.darkNavy)
                                Text("2023. 09. 29 - 2023. 10 .01")
                                    .font(.light10)
                                    .foregroundColor(.midGray)
                            }
                            Text("총 7일")
                                .font(.light13)
                                .foregroundColor(.darkNavy)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 25, leading: 20, bottom: 25, trailing: 20))
                    .background(Color.backgroundBlue)
                    .cornerRadius(15)
                }
                //
                
                
                VStack (alignment: .leading, spacing: 4) {
                    Text("예상 포인트 내역")
                        .font(.light10)
                        .foregroundColor(.midGray)
                        .padding(.bottom, 7)
                        .padding(.leading, 12)
                    
                    VStack (alignment: .leading, spacing: 9) {
                        HStack (alignment: .center) {
                            Text("현재 포인트")
                                .font(.medium10)
                                .foregroundColor(.darkNavy)
                            Spacer()
                            Text("15, 000 P")
                                .font(.light13)
                                .foregroundColor(.darkNavy)
                                .padding(.trailing, 150)
                        }
                        HStack (alignment: .center) {
                            Text("보증금  ")
                                .font(.medium10)
                                .foregroundColor(.darkNavy)
                            Spacer()
                            Text("- 9, 000 P")
                                .font(.light13)
                                .foregroundColor(.darkNavy)
                                .padding(.trailing, 150)
                        }
                        HStack (alignment: .center) {
                            Text("현재 포인트")
                                .font(.medium10)
                                .foregroundColor(.darkNavy)
                            Spacer()
                            Text("15, 000 P")
                                .font(.light13)
                                .foregroundColor(.darkNavy)
                                .padding(.trailing, 150)
                        }
                        
                        Divider()
                            .frame(width: .infinity, height: 1)
                            .background(Color.white)
                        
                        HStack (alignment: .center) {
                            Text("잔여 포인트")
                                .font(.medium10)
                                .foregroundColor(.darkNavy)
                            Spacer()
                            Text("5, 000 P")
                                .font(.gmarket(.medium, size: 12))
                                .foregroundColor(.darkNavy)
                                .padding(.trailing, 150)
                        }
                    }//
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 25, leading: 20, bottom: 25, trailing: 20))
                    .background(Color.backgroundBlue)
                    .cornerRadius(15)
                }
                
                Spacer()
                
            }
            // Button
            HStack {
                Button {
                    // Go Back to previous page
                } label: {
                    Text("돌아가기")
                        .font(.medium17)
                        .foregroundColor(.mainBlue)
                        .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.mainBlue, lineWidth: 1)
                        )
                }
                
                Button {
                    // Charge or Borrow
                    if needCharge {
                        // 충전 창으로 이동
                        print("Move to Charge View")
                    } else {
                        // Borrorw Alert 띄우기
                        print("Alert!")
                    }
                } label: {
                    Text(needCharge ? "충전하기" : "대여하기")
                        .font(.medium17)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .padding(.horizontal, 20)
                        .background((RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(.mainBlue)))
                        .foregroundColor(.white)
                }
            }
            .alert(isPresented: $needAlert, content: {
                Alert(title: Text("대여 완료"), message: Text("대여 완료 되었습니다."), dismissButton: .default(Text("확인")))
            })
            .padding(.bottom, 10)
        }//
        .padding(.horizontal, 20)
        .navigationTitle("대여하기")
    }
}

struct RentCheckView_Previews: PreviewProvider {
    static var previews: some View {
        RentCheckView()
    }
}
