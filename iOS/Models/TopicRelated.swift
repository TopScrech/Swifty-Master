import Foundation

extension Topic {
    var related: [Topic] {
        switch self {
        case .textField:   [.textEditor]
        case .textEditor:  [.textField]
            
        case .image:       [.label]
        case .label:       [.image]
            
        case .contextMenu: [.menu]
        case .menu:        [.contextMenu]
            
        case .alert:              [.confirmationDialog]
        case .confirmationDialog: [.alert]
            
        case .link:      [.shareLink]
        case .shareLink: [.link]
            
        case .vStack:      [.hStack]
        case .hStack:      [.vStack]
            
        case .color:       [.gradient]
        case .gradient:    [.color]
            
        case .scrollView:  [.list]
        case .list:        [.scrollView, .swipeActions]
        case .swipeActions: [.list]
            
        case .badges:      [.settingsAlternativeIcons]
            
        case .slider:      [.stepper]
        case .stepper:     [.slider]
            
        case .spacer:      [.divider]
        case .divider:     [.spacer]
            
        case .settingsAlternativeIcons: [.badges]
            
        case .lowPowerMode: [.preventScreenSleep]
        case .preventScreenSleep: [.lowPowerMode, .preventScreenshots]
        case .preventScreenshots: [.preventScreenSleep]
            
        default: []
        }
    }
}
