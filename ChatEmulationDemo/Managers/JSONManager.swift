//
//  JSONManager.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import Foundation

let jsonFileName: String = "ChatScenario.json"

struct JSONManager {
    // MARK: - Properties
    var messages: [ChatMessage] = [ChatMessage]()
    
    
    // MARK: - Functions
    mutating func update(with items: [ChatMessage]) {
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileUrl = documentsDirectoryUrl.appendingPathComponent(jsonFileName)

        do {
            _ = try Data(contentsOf: fileUrl, options: [])
        
        } catch {
            // Create new empty json file
            save()
        }
        
        if let chatMessages = retrieve() { //, let messages = items as? [Annotations], let annotationsItems = items as? [Annotations] {
            messages = chatMessages
            messages.append(contentsOf: items)
        }
        
        // Save json file
        save()
    }
        
    func save() {
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileUrl = documentsDirectoryUrl.appendingPathComponent(jsonFileName)

        do {
            let messagesData = try JSONEncoder().encode(messages)
            try messagesData.write(to: fileUrl, options: [])
        } catch {
            Logger.log(message: error.localizedDescription, event: .error)
        }
    }
    
    func retrieve() -> [ChatMessage]? {
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileUrl = documentsDirectoryUrl.appendingPathComponent(jsonFileName)
        
        do {
            let jsonData = try Data(contentsOf: fileUrl, options: [])
            return try JSONDecoder().decode([ChatMessage].self, from: jsonData)
        } catch {
            Logger.log(message: error.localizedDescription, event: .error)
            return nil
        }
    }
}
