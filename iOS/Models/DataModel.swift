// An observable data model of recipes and miscellaneous groupings

import SwiftUI

@Observable
final class DataModel {
    private let recipes: [Topic] = [
        .init(name: "Text", category: .content),
        .init(name: "TextField", category: .content),
        .init(name: "Text Editor", category: .content),
        .init(name: "Image", category: .content),
        .init(name: "SF Symbols", category: .content),
        .init(name: "Label", category: .content),
        .init(name: "Shape", category: .content),
        .init(name: "Divider", category: .content),
        .init(name: "Custom Keyboard", category: .content)
    ]
    
    private var recipesById: [Topic.ID: Topic] = [:]
    
    /// The shared singleton data model object
    static let shared: DataModel = {
        DataModel()
    }()
    
    /// The recipes for a given category, sorted by name
    func recipes(in category: Category?) -> [Topic] {
        recipes.filter {
            $0.category == category
        }
    }
    
    /// The related recipes for a given recipe, sorted by name
    func recipes(relatedTo recipe: Topic) -> [Topic] {
        recipes.filter {
            recipe.related.contains($0.id)
        }
    }
    
    /// Accesses the recipe associated with the given unique identifier
    /// if the identifier is tracked by the data model; otherwise, returns `nil`
    subscript(recipeId: Topic.ID) -> Topic? {
        recipesById[recipeId]
    }
}
