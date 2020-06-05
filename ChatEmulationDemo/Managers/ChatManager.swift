//
//  ChatManager.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 05.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import SwiftUI
import Combine

class ChatManager: ObservableObject {
    // MARK: - Properties
    fileprivate let jsonMessages: [ChatMessage]
    @Published var chatMessages: [ChatMessage]

    var didChange = PassthroughSubject<Void, Never>()
    let chatCount: Int
    

    // MARK: - Initialization
    init() {
        let data: Data
        let fileName = "chatScenario.json"

        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
        }
        
        do {
            var items = try JSONDecoder().decode([ChatMessage].self, from: data)
            
            for (index, var item) in items.enumerated() {
                let line = "\(index). " + item.line
                
                if line.count > 550 {
                    Logger.log(message: "line # \(index) before: \n\(line)", event: .debug)
                    item.line = line.substring(to: 550)
                } else {
                    item.line = line
                }
                   
                items[index] = item
                Logger.log(message: "item line after: \n\(item.line)", event: .debug)
            }

            self.jsonMessages = items
            self.chatCount = items.count
            self.chatMessages = [items[0]]
        } catch {
            fatalError("Couldn't parse \(fileName) as \(ChatMessage.self):\n\(error)")
        }
    }
    
    func nextMessage(_ index: Int) {
        Logger.log(message: "current index = \(index)", event: .debug)
        self.chatMessages.append(self.jsonMessages[index])
        self.didChange.send()
    }
}
