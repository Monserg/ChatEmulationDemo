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
        let items = try? decoder.decode([ChatMessage].self, from: data)
        self.messages = items!
    }
}
