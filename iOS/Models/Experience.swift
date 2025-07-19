// An enumeration of navigation experiences used to define the app architecture

import SwiftUI

enum Experience: Int, Identifiable, CaseIterable, Codable {
    case stack,
         twoColumn
    
    var id: Int {
        rawValue
    }
    
    /// The image name of the navigation experience.
    var imageName: String {
        switch self {
        case .stack: "list.bullet.rectangle.portrait"
        case .twoColumn: "sidebar.left"
        }
    }
    
    /// The localized name of the navigation experience.
    var localizedName: LocalizedStringKey {
        switch self {
        case .stack: "Stack"
        case .twoColumn: "Two columns"
        }
    }
}
