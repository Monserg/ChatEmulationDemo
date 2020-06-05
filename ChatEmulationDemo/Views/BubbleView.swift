//
//  BubbleView.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import SwiftUI

struct BubbleView: View {
    @State private var opacity = 0.0
    @State private var offsetY: CGFloat = 0.0

    var index: Int
    var message: ChatMessage
    var complete: (() -> Void )
    
    var body: some View {
        VStack {
            HStack(alignment: VerticalAlignment.bottom, spacing: 0) {
                Triangle()
                    .fill(Color.white)
                    .frame(width: 22, height: 18)
                    .zIndex(10)
                    .padding(.trailing, -11)
                
                Text(self.message.line)
                    .multilineTextAlignment(.leading)
                    .padding(10)
                    .foregroundColor(Color.black)
                    .background(Color.bubble)
                    .cornerRadius(5)
                
                Spacer()
            }
            .multilineTextAlignment(.leading)
            .clipped()
            .shadow(color: Color.shadow, radius: 2, x: 1, y: 1)
            .opacity(self.opacity)
            .onAppear {
                withAnimation(Animation.linear(duration: 0.5)) {
                    self.opacity = 1.0
                    
                    withAnimation(Animation.linear(duration: 0.5).delay(0.5)) {
                        self.offsetY = 0.0

//                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
//                                _ = VoiceManager(speechMessage: messages[self.index].line) {
//                                    Logger.log(message: "speech finished", event: .debug)

                                    #warning("Load next message")
                                    self.complete()
//                                }
//                            }
                    }
                }
            }
            
            Spacer()
                .frame(height: 30)
        }
    }
    
    private func test() {
        withAnimation(Animation.linear(duration: 0.5).delay(0.5)) {
            //            self.offsetY = 450.0
        }
    }
}


// MARK: - PreviewProvider
struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(index: 0, message: ChatMessage(line: "0. XXXXC", author: nil)) {
            Logger.log(message: "finished", event: .debug)
        }
    }
}
