//
//  JSONManager.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import SwiftUI

class JSONManager: ObservableObject {
    // MARK: - Properties
    @Published var messages: [ChatMessage]
    
    
    // MARK: - Initialization
    init() {
        let url = Bundle.main.url(forResource: "chatScenario", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()        
        var items = try? decoder.decode([ChatMessage].self, from: data)
        
        for (index, var item) in items!.enumerated() {
            let line = item.line
            
            if line.count > 550 {
                Logger.log(message: "line # \(index) before: \n\(line)", event: .debug)
                item.line = line.substring(to: 550)
                items![index] = item
                Logger.log(message: "item line after: \n\(item.line)", event: .debug)
            }
        }

        self.messages = items!
    }
}
