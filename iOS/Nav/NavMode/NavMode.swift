import SwiftUI

enum NavMode: Int, Identifiable, CaseIterable, Codable {
    case stack, twoColumn
    
    var id: Int {
        rawValue
    }
    
    var icon: String {
        switch self {
        case .stack: "list.bullet.rectangle.portrait"
        case .twoColumn: "sidebar.left"
        }
    }
    
    var name: LocalizedStringKey {
        switch self {
        case .stack: "Stack"
        case .twoColumn: "Two columns"
        }
    }
}
