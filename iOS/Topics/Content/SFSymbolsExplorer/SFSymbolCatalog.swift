import Foundation

nonisolated struct SFSymbolCatalog: Decodable, Sendable {
    let symbolCount: Int
    let categories: [SFSymbolCategory]
    let symbols: [SFSymbolEntry]
    
    nonisolated static func load() -> SFSymbolCatalog {
        guard let url = Bundle.main.url(forResource: "SFSymbolCatalog", withExtension: "json") else {
            return SFSymbolCatalog(symbolCount: 0, categories: [], symbols: [])
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(SFSymbolCatalog.self, from: data)
        } catch {
            return SFSymbolCatalog(symbolCount: 0, categories: [], symbols: [])
        }
    }
}

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

nonisolated struct SFSymbolEntry: Decodable, Identifiable, Hashable, Sendable {
    let name: String
    let availability: String
    let categories: [String]
    let searchTerms: [String]
    let restriction: String?
    
    var id: String {
        name
    }
    
    var isRestricted: Bool {
        restriction != nil
    }
    
    nonisolated func matches(_ query: String) -> Bool {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedQuery.isEmpty else {
            return true
        }
        
        return name.localizedStandardContains(trimmedQuery) ||
        searchTerms.contains { $0.localizedStandardContains(trimmedQuery) }
    }
}
