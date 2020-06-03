//
//  BubbleView.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import SwiftUI

struct BubbleView: View {
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
            .offset(x: 20, y: 0)
            
            Spacer()
        }
    }
}


// MARK: - PreviewProvider
struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(message: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.")
    }
}
