//
//  NoticeView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/14.
//

import SwiftUI

struct NoticeView: View {
    @State var selectedType = "공지사항"

    var body: some View {
        InsetGroupedListView(selectedType: $selectedType)
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
