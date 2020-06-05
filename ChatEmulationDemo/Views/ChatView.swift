//
//  ChatView.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    @State var messagesCount = 9

    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                Spacer()

                VStack {
                     ForEach(8 ..< self.messagesCount, id: \.self) { index in
                        BubbleView(index: index) {
                            self.messagesCount += 1
                        }
                    }
                    .frame(width: fullView.size.width * 0.75)
                }
                    
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().isScrollEnabled = true
//                    UITableView.appearance().sroll = true
                }
                
            }
            .navigationBarTitle(Text("Dialogue"), displayMode: .inline)
        }
    }

        
        /*
        GeometryReader { fullView in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    ForEach(0..<2) { index in
                        GeometryReader { bubbleView in
                            BubbleView(index: 9) {
//                                Logger.log(message: "\(bubbleView.size)", event: .debug)
                            }
                            .frame(width: fullView.size.width * 0.75)
                        }
//                        .frame(height: JSONManager().messages[index].line.textHeightFrom(width: fullView.size.width * 0.75))
                    }
                    
                }
                .padding(.horizontal, 20)
                    .padding(.vertical, 70) //(fullView.size.height - 0) / 2)
            }
        }
        .edgesIgnoringSafeArea(.all)
        */
    }


    /*
    @State var messagesCount = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(0 ..< self.messagesCount, id: \.self) { index in
                        return BubbleView(index: index) {
                            self.messagesCount += 1
                            Logger.log(message: "\(self.messagesCount)", event: .debug)
                        }
                        .frame(width: 400, height: 150)
                    }
                }
            }
        .navigationBarTitle("Dialogue", displayMode: .inline)
            
        }
        /*
//        NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0 ..< self.messagesCount, id: \.self) { index in
//                        GeometryReader { geometryProxy in
                       return BubbleView(index: index) {
                            self.messagesCount += 1
                            Logger.log(message: "\(self.messagesCount)", event: .debug)
                        }
//                            .frame(width: geometryProxy.size.width * 0.75, height: geometryProxy.size.height)

//                        }
//                    .frame(width: geometryProxy.size.width * 0.75, height: geometryProxy.size.height)

//                .fixedSize()
                    
                    }
//                    Spacer()

//                }
            }
//            .frame(width: geometryProxy.size.width, height: geometryProxy.size.height, alignment: .bottomLeading)
        
//            Spacer()
        }
            
        .navigationBarTitle("Dialogue", displayMode: .inline)
        */
//.padding()
//        }
        
        /*
        VStack(alignment: .leading, spacing: 30) {
            ForEach(0 ..< self.messagesCount, id: \.self) { index in
                BubbleView(index: index) {
                    self.messagesCount += 1
                    Logger.log(message: "\(self.messagesCount)", event: .debug)
                }
            }
        }
        */
        
        /*
        NavigationView {
            
//            List {
            VStack(alignment: .leading, spacing: 30) {
                ForEach(0..<self.messagesCount) { index in
//                    VStack(alignment: .leading, spacing: 30) {
            
                    BubbleView(index: index) {
                        self.messagesCount = 2
                        Logger.log(message: "\(self.messagesCount)", event: .debug)
                    }
                    
//                    (message: self.jsonManager.messages[index].line, index: <#UInt#>)
//                    }
//                }
            }
            
//            Color.red
//                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle("Dialogue", displayMode: .inline)
        }
        */
    }
    
//    private func ddd() -> [ChatMessage] {
//        self.messagesTest = [ jsonManager.messages[0], jsonManager.messages[1] ]
//    }
 
}
*/
    
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
