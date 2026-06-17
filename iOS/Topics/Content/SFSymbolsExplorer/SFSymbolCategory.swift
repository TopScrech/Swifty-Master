nonisolated struct SFSymbolCategory: Decodable, Identifiable, Hashable, Sendable {
    let key: String
    let icon: String
    
    var id: String {
        key
    }
    
    var title: String {
        Self.titles[key] ?? key.capitalized
    }
    
    private static let titles = [
        "all": "All",
        "whatsnew": "What's New",
        "draw": "Draw",
        "variable": "Variable",
        "multicolor": "Multicolor",
        "communication": "Communication",
        "weather": "Weather",
        "maps": "Maps",
        "objectsandtools": "Objects & Tools",
        "devices": "Devices",
        "cameraandphotos": "Camera & Photos",
        "gaming": "Gaming",
        "connectivity": "Connectivity",
        "transportation": "Transportation",
        "automotive": "Automotive",
        "accessibility": "Accessibility",
        "privacyandsecurity": "Privacy & Security",
        "human": "Human",
        "home": "Home",
        "fitness": "Fitness",
        "nature": "Nature",
        "editing": "Editing",
        "textformatting": "Text Formatting",
        "media": "Media",
        "keyboard": "Keyboard",
        "commerce": "Commerce",
        "time": "Time",
        "health": "Health",
        "shapes": "Shapes",
        "arrows": "Arrows",
        "indices": "Indices",
        "math": "Math"
    ]
}
