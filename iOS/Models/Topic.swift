// A data model for a recipe and its metadata, including its related recipes

import SwiftUI

struct Topic: Codable, Hashable, Identifiable {
    var id: String {
        name
    }
    
    var name: String
    var category: Category
    var related: [Topic.ID]
    var icon: String?
    
    init(
        _ name: String,
        category: Category,
        related: [Topic.ID] = [],
        icon: String? = nil
    ) {
        self.name = name
        self.category = category
        self.related = related
        self.icon = icon
    }
}

extension Topic {
    static var mock: Topic {
        .init("Test", category: .content)
    }
}
