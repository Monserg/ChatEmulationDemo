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
    @State private var index = 1
    @State private var offsetY: CGFloat = 450.0
    
    var message: String
    var isFirst: Bool = false
    
    var body: some View {
        GeometryReader { geometryProxy in
            HStack(alignment: VerticalAlignment.bottom, spacing: 0) {
                Triangle()
                    .fill(Color.white)
                    .frame(width: 22, height: 18)
                    .zIndex(10)
                    .padding(.trailing, -11)
                
                Text(self.message)
                    .multilineTextAlignment(.leading)
                    .padding(10)
                    .foregroundColor(Color.black)
                    .background(Color.bubble)
                    .cornerRadius(5)
            }
            .frame(width: geometryProxy.size.width * 0.75, height: geometryProxy.size.height, alignment: .bottomLeading)
            .clipped()
            .shadow(color: Color.shadow, radius: 4, x: 1, y: 1)
            .offset(x: 20, y: self.index == 0 ? 0.0 : self.offsetY)
            .opacity(self.opacity)
            .onAppear {
                withAnimation(Animation.linear(duration: 0.5)) {
                    self.opacity = 1.0

                    withAnimation(Animation.linear(duration: 0.5).delay(0.5)) {
                        self.offsetY = 0.0

                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                            _ = VoiceManager(speechMessage: self.message) {
                                Logger.log(message: "speech finished", event: .debug)
                                
                                #warning("Load next message")
                                self.test()
                            }
                        }
                    }
                }
            }
            

            Spacer()
        }
    }
    
    private func test() {
        withAnimation(Animation.linear(duration: 0.5).delay(0.5)) {
            self.offsetY = 450.0
            
        }
    }
}


// MARK: - PreviewProvider
struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(message: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.")
    }
}
