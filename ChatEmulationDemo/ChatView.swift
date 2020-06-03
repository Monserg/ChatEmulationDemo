//
//  ChatView.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import UIKit
import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            Color.body
                .edgesIgnoringSafeArea(.all)

            Text("Hello, Sergo!")
                
                .navigationBarTitle("Dialogue", displayMode: .inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
