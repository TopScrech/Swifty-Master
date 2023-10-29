//
//  Item.swift
//  Everything SwiftUI
//
//  Created by Sergei Saliukov on 29/10/2023.
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
