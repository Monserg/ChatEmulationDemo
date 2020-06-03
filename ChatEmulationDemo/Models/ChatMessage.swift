//
//  ChatMessage.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 03.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import Foundation

struct ChatMessage: Codable, Hashable {
    // MARK: - Properties
    let line: String
    let author: String?
}
