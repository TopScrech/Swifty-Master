// An observable data model of recipes and miscellaneous groupings

import SwiftUI

@Observable
final class DataModel {
    private(set) var recipes: [Topic] = [
        .init(id: UUID(), name: "Test", category: .content)
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
