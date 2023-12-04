//
//  PointChargeView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/05.
//

import SwiftUI

struct PointChargeView: View {
    let amountOptions = ["1, 000 포인트 / 1, 000원", "3, 000 포인트 / 3, 000원", "5, 000 포인트 / 5, 000원", "10, 000 포인트 / 10, 000원", "20, 000 포인트 / 20, 000원"]
    let paymentOptions = ["카카오페이", "애플페이", "네이버페이"]
    
    @State private var userPoint: Int = 8000
    @State private var selectedAmountOption: String?
    @State private var selectedPaymentOption: String?

    
    var body: some View {
        ZStack {
            Color.backgroundBlue
                .ignoresSafeArea()
            
            VStack (spacing: 25) {
                // User Info
                HStack(alignment: .center) {
                    Text("현재 포인트")
                        .font(.medium15)
                    Spacer()
                    Text("\(userPoint) 포인트")
                        .font(.medium15)
                }
                .foregroundColor(.darkNavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 17, leading: 20, bottom: 17, trailing: 22))
                .background(.white)
                .cornerRadius(15)
                
                // Check Amount
                VStack (alignment: .leading) {
                    Text("충전할 포인트")
                        .foregroundColor(.darkNavy)
                        .font(.medium15)
                        .padding(.bottom, 8)
                    // RadioButtons
                    VStack (alignment: .leading, spacing: 11) {
                        ForEach(amountOptions, id: \.self) { option in
                            Button(action: {
                                selectedAmountOption = option
                            }) {
                                HStack(spacing: 15) {
                                    Image(systemName: selectedAmountOption == option ? "largecircle.fill.circle" : "circle")
                                        .imageScale(.medium)
                                        .foregroundColor(selectedAmountOption == option ? .mainBlue : .gray)
                                    
                                    Text(option)
                                        .foregroundColor(.darkNavy)
                                        .font(.light13)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 17, leading: 20, bottom: 17, trailing: 20))
                .background(.white)
                .cornerRadius(15)
                
                // Check Payment
                VStack (alignment: .leading) {
                    Text("결제수단")
                        .foregroundColor(.darkNavy)
                        .font(.medium15)
                        .padding(.bottom, 8)
                    // RadioButtons
                    VStack (alignment: .leading, spacing: 11) {
                        ForEach(paymentOptions, id: \.self) { option in
                            Button(action: {
                                selectedPaymentOption = option
                            }) {
                                HStack(spacing: 15) {
                                    Image(systemName: selectedPaymentOption == option ? "largecircle.fill.circle" : "circle")
                                        .imageScale(.medium)
                                        .foregroundColor(selectedPaymentOption == option ? .mainBlue : .gray)
                                    
                                    Text(option)
                                        .foregroundColor(.darkNavy)
                                        .font(.light13)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 17, leading: 20, bottom: 17, trailing: 20))
                .background(.white)
                .cornerRadius(15)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        
    }
}

struct PointChargeView_Previews: PreviewProvider {
    static var previews: some View {
        PointChargeView()
    }
}
