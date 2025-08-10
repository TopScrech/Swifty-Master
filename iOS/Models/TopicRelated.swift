import Foundation

extension Topic {
    var related: [Topic] {
        switch self {
        case .textField: [.textEditor]
        case .textEditor: [.textField]
            
        case .image: [.sfSymbols]
        case .sfSymbols: [.image]
            
        case .contextMenu: [.menu]
        case .menu: [.contextMenu]
            
        case .vStack: [.hStack]
        case .hStack: [.vStack]
            
        case .color: [.gradient]
        case .gradient: [.color]
            
        case .grid: [.lazyVGrid, .lazyHGrid]
        case .lazyHGrid: [.grid, .lazyVGrid]
        case .lazyVGrid: [.grid, .lazyHGrid]
            
        case .scrollView: [.list]
        case .list: [.scrollView]
            
        case .slider: [.stepper]
        case .stepper: [.slider]
            
        case .spacer: [.divider]
        case .divider: [.spacer]
            
        default: []
        }
    }
}
