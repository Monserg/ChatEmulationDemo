//
//  ChatView.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var jsonManager = JSONManager()
    
    var body: some View {
        NavigationView {
//            List {
//            VStack(alignment: .leading, spacing: 30) {
//                ForEach(0..<jsonManager.messages.count) { index in
//                    VStack(alignment: .leading, spacing: 30) {
            
            BubbleView(message: self.jsonManager.messages[0].line)
//                        Text(self.jsonManager.messages[index].line)
//                    }
//                }
//            }
            
            Color.body
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle("Dialogue", displayMode: .inline)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
