import Foundation

extension Topic {
#warning("Remove id and/or Topic")
    var related: [Topic.ID] {
        switch self {
        case .textField: [Topic.textEditor.id]
        case .textEditor: [Topic.textField.id]
            
        case .image: [Topic.sfSymbols.id]
        case .sfSymbols: [Topic.image.id]
            
        case .contextMenu: [Topic.menu.id]
        case .menu: [Topic.contextMenu.id]
            
        case .vStack: [Topic.hStack.id]
        case .hStack: [Topic.vStack.id]
            
        case .color: [Topic.gradient.id]
        case .gradient: [Topic.color.id]
            
        case .grid: [Topic.lazyVGrid.id, Topic.lazyHGrid.id]
        case .lazyHGrid: [Topic.grid.id, Topic.lazyVGrid.id]
        case .lazyVGrid: [Topic.grid.id, Topic.lazyHGrid.id]
            
        case .scrollView: [Topic.list.id]
        case .list: [Topic.scrollView.id]
            
        case .slider: [Topic.stepper.id]
        case .stepper: [Topic.slider.id]
            
        case .spacer: [Topic.divider.id]
        case .divider: [Topic.spacer.id]
            
        default: []
        }
    }
}
