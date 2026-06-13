import Foundation

extension Topic {
    var isSpecialExperience: Bool {
        switch self {
        case .sfSymbolsExplorer:
            true
            
        default:
            false
        }
    }
}
