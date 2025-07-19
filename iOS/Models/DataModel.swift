// An observable data model of recipes and miscellaneous groupings

import SwiftUI

@Observable
final class DataModel {
    private let recipes = Topic.allCases
//    private let recipes: [Topic] = [
//        // Content
//        .init("Text", category: .content),
//        .init("TextField", category: .content),
//        .init("Text Editor", category: .content),
//        .init("Image", category: .content),
//        .init("SF Symbols", category: .content),
//        .init("Label", category: .content),
//        .init("Shape", category: .content),
//        .init("Divider", category: .content),
//        .init("Custom Keyboard", category: .content),
//        
//        // Control
//        .init("Button", category: .control),
//        .init("Menu", category: .control),
//        .init("Context Menu", category: .control),
//        .init("Toggle", category: .control),
//        .init("Slider", category: .control),
//        .init("Stepper", category: .control),
//        .init("Picker", category: .control),
//        
//        // View
//        .init("Sheet", category: .view),
//        .init("Popover", category: .view),
//        .init("Alert", category: .view),
//        .init("Empty View", category: .view),
//        .init("App Store Overlay", category: .view),
//        
//        // Navigation
//        .init("Navigation View", category: .navigation),
//        .init("Navigation Stack", category: .navigation),
//        .init("Navigation Split View", category: .navigation),
//        .init("Navigation Bar", category: .navigation),
//        .init("Navigation Link", category: .navigation),
//        .init("Pass a view", category: .navigation),
//        .init("Link", category: .navigation),
//        
//        // Collections
//        .init("VStack", category: .collections),
//        .init("HStack", category: .collections),
//        .init("ZStack", category: .collections),
//        .init("List", category: .collections),
//        .init("ScrollView", category: .collections),
//        .init("Grid", category: .collections),
//        .init("LazyVGrid", category: .collections),
//        .init("LazyHGrid", category: .collections),
//        .init("TabView", category: .collections),
//        
//        // Layout
//        .init("Spacer", category: .layout),
//        .init("Padding", category: .layout),
//        .init("Frame", category: .layout),
//        .init("Position Point", category: .layout),
//        .init("Geometry Reader", category: .layout),
//        .init("Equal Size Views", category: .layout),
//        
//        // Design
//        .init("Color", category: .design),
//        .init("Gradient", category: .design),
//        
//        // System
//        .init("Detect OS version", category: .system),
//        .init("Detect Dark Mode", category: .system),
//        .init("Detect device used", category: .system),
//        .init("Differentiate OS", category: .system),
//        .init("Detect screen size", category: .system),
//        .init("Detect compact or regular mode", category: .system),
//        .init("Detect lang", category: .system)
//    ]
    
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

