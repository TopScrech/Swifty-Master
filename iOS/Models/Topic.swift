// A data model for a recipe and its metadata, including its related recipes

import SwiftUI

struct Topic: Codable, Hashable, Identifiable {
    let id: UUID
    var name: String
    var category: Category
    var ingredients: [Ingredient]
    var related: [Topic.ID] = []
    var imageName: String? = nil
}

extension Topic {
    static var mock: Topic {
        DataModel.shared.recipes[0]
    }
}
