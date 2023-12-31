//
//  ChatView.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/12/06.
//

import SwiftUI

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var text = ""
    @FocusState private var isFocused
    @State private var messageIDToScroll: UUID?
    
    var body: some View {
        NavigationView {
            
            VStack {
                GeometryReader { reader in
                    ScrollView {
                        ScrollViewReader { scrollReader in
                            getMessagesView(viewWidth: reader.size.width)
                                .padding(.horizontal, 20)
                                .onChange(of: messageIDToScroll) { _ in
                                    if let messageID = messageIDToScroll {
                                        scrollTo(messageId: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                    }
                                }
                                .onAppear {
                                    if let messageId = chatMessage.last?.id {
                                        scrollTo(messageId: messageId, anchor: .bottom, shouldAnimate: true, scrollReader: scrollReader)
                                    }
                                }
                        }
                        
                    }
                }
                .padding(.bottom, 5)
                .padding(.top, 10)
                
                toolBarView()
            }
            .navigationBarTitle("고객센터", displayMode: .inline)
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
            .background(Color.backgroundBlue)
        }
        
    }
    
    func scrollTo(messageId: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageId, anchor: anchor)
            }
        }
    }
    
    func toolBarView() -> some View {
        let height: CGFloat = 37
        return VStack {
            HStack {
                TextField("채팅을 입력해주세요.", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button {
                    // sendMessage
                    let msg = Chat(userId: 1, contents: text, contentType: "TEXT", isAdmin: false, date: Date())
                    chatMessage.append(msg)
                    text = ""
                    messageIDToScroll = msg.id
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                            Circle()
                            .foregroundColor(text.isEmpty ? .gray : .mainBlue))
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    

    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

