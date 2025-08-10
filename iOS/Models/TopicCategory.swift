import Foundation

extension Topic {
    var category: Category {
        switch self {
        case .text, .textField, .textEditor, .image, .sfSymbols, .label, .shape, .divider:
                .content
            
        case .button, .menu, .contextMenu, .toggle, .slider, .stepper, .picker, .gauges, .progressView, .badges:
                .control
            
        case .sheet, .popover, .alert, .emptyView, .appStoreOverlay:
                .view
            
        case .dismiss, .navigationView, .navigationStack, .navigationSplitView, .navigationBar, .navigationLink, .passAView, .link:
                .navigation
            
        case .vStack, .hStack, .zStack, .list, .scrollView, .grids, .tabView:
                .collections
            
        case .spacer, .padding, .frame, /*.positionPoint, */.geometryReader, .equalSizeViews:
                .layout
            
        case .color, .gradient:
                .design
            
        case .detectOSVersion, .detectDarkMode, .differentiateOS, .detectScreenSize, .detectCompactOrRegular, .detectLang, .lowPowerMode:
                .system
        }
    }
}
