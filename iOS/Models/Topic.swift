// A data model for a recipe and its metadata, including its related recipes

import SwiftUI

struct Topic: Codable, Hashable, Identifiable {
    var id: String {
        name
    }
    
    var name: String
    var category: Category
    var related: [Topic.ID] = []
    var imageName: String? = nil
}

extension Topic {
    static var mock: Topic {
        .init(name: "Test", category: .content)
    }
}
