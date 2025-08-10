import SwiftUI

enum Experience: Int, Identifiable, CaseIterable, Codable {
    case stack,
         twoColumn
    
    var id: Int {
        rawValue
    }
    
    /// The image name of the navigation experience
    var icon: String {
        switch self {
        case .stack: "list.bullet.rectangle.portrait"
        case .twoColumn: "sidebar.left"
        }
    }
    
    /// The localized name of the navigation experience
    var name: LocalizedStringKey {
        switch self {
        case .stack: "Stack"
        case .twoColumn: "Two columns"
        }
    }
}
