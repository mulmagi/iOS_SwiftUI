//
//  InsetGroupedListView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/14.
//

import SwiftUI

struct InsetGroupedListView: View {
    
    @Binding var selectedType: String
    var dataExample: [Data] {
        return getData(selectedType: selectedType)
    }
    
    private func getData(selectedType: String) -> [Data] {
        switch selectedType {
        case "대여 / 반납":
            return dataExampleBorrow
        case "포인트":
            return dataExamplePoint
        case "기타":
            return dataExampleElse
        default:
            return dataExampleWhole
        }
    }
    
    // 연도와 월로 그룹화
    var groupedData: [Int: [Int: [Data]]] {
        Dictionary(grouping: dataExample, by: { $0.year })
            .mapValues { Dictionary(grouping: $0, by: { $0.month }) }
    }
    
    var body: some View {
        List {
            ForEach(groupedData.keys.sorted().reversed(), id: \.self) { year in
                    ForEach(groupedData[year]!.keys.sorted().reversed(), id: \.self) { month in
                        Section(header: Text("\(year)년 \(month)월")) {
                            ForEach(groupedData[year]![month]!, id: \.self) { item in
                                VStack (alignment: .leading) {
                                    HStack {
                                        Text("[\(item.header)]")
                                            .font(.medium15)
                                            .foregroundColor(.mainBlue)
                                        Text(item.title)
                                            .font(.gmarket(.light, size: 15))
                                    }
                                    .padding(.bottom, 6)
                                    HStack {
                                        Text(item.body ?? " ")
                                        Spacer()
                                        Text("\(item.dateString) | \(item.timeString)")
                                            .foregroundColor(Color.darkGray)
                                            .opacity(0.6)
                                    }
                                    .font(.light10)

                                }
                            }
                        }
                    }
                }
            }
        }
}

struct InsetGroupedListView_Previews: PreviewProvider {
    static var previews: some View {
        InsetGroupedListView(selectedType: .constant ("전체"))
    }
}
