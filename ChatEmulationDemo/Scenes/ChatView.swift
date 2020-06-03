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
            List {
                ForEach(jsonManager.messages.enumeratedArray(), id: \.element) { index, message in
                    VStack(alignment: .leading, spacing: 10){
                        Text(message.line)
                    }
                }
            }
            
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
