//
//  Item.swift
//  toDoList
//
//  Created by abhishek singh on 23/02/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
