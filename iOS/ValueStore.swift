import SwiftUI

final class ValueStore: ObservableObject {
    @AppStorage("color_theme") var colorTheme: ColorTheme = .system
    @AppStorage("favorite_topics") var favoriteTopics: [Topic] = []
    @AppStorage("experience") var experience: Experience?
    
    func addOrRemoveFavorite(_ item: Topic) {
        if favoriteTopics.contains(item) {
            favoriteTopics.removeAll {
                $0 == item
            }
        } else {
            favoriteTopics.append(item)
        }
    }
}

extension Array: @retroactive RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        
        self = result
    }
    
    public var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        
        return result
    }
}
