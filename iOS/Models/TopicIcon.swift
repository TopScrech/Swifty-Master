import Foundation

extension Topic {
    var icon: String {
        switch self {
            // Content
        case .text: "textformat"
        case .textField: "keyboard"
        case .textEditor: "square.and.pencil"
        case .image: "photo"
        case .sfSymbols: "environments"
        case .label: "character.textbox"
        case .shape: "circle.on.square"
        case .divider: "square.and.line.vertical.and.square"
            
            // Control
        case .button: "digitalcrown.press"
        case .menu: "filemenu.and.pointer.arrow"
        case .contextMenu: "contextualmenu.and.pointer.arrow"
        case .toggle: "switch.2"
        case .slider: "slider.horizontal.3"
        case .stepper: "plus.minus.capsule"
        case .picker: "checklist"
        case .gauges : "gauge.open"
        case .progressView : "progress.indicator"
        case .badges : "app.badge"
            
            // View
        case .sheet: "square.stack"
        case .popover: "questionmark.bubble"
        case .alert: "exclamationmark.bubble"
        case .emptyView: "rectangle.dashed"
        case .appStoreOverlay: "apple.logo"
            
            // Nav
        case .dismiss: "chevron.backward.chevron.backward.dotted"
        case .navigationView: "macwindow"
        case .navigationStack: "macwindow.on.rectangle"
        case .navigationSplitView: "sidebar.left"
        case .navigationBar: "menubar.arrow.up.rectangle"
        case .navigationLink: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath"
        case .passAView: "inset.filled.trailinghalf.arrow.trailing.rectangle"
        case .link: "link"
            
            // Collections
        case .vStack: "square.split.1x2"
        case .hStack: "square.split.2x1"
        case .zStack: "square.stack.3d.up"
        case .list: "list.bullet.clipboard"
        case .scrollView: "scroll"
        case .grid: "square.grid.3x3"
        case .lazyGrids: "square.grid.3x2"
        case .tabView: "platter.filled.bottom.iphone"
            
            // Layout
        case .spacer: "space"
        case .padding: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right"
        case .frame: "photo.artframe"
            //        case .positionPoint: "mappin.and.ellipse"
        case .geometryReader: "arrow.up.and.down.and.arrow.left.and.right"
        case .equalSizeViews: "rectangle.split.3x1"
            
            // Design
        case .color: "paintpalette"
        case .gradient: "app.translucent"
            
            // System
        case .detectOSVersion: "waveform.path.ecg.magnifyingglass"
        case .detectDarkMode: "circle.righthalf.filled"
        case .differentiateOS: "macbook.and.vision.pro"
        case .detectScreenSize: "arrow.down.left.and.arrow.up.right.rectangle"
        case .detectCompactOrRegular: "iphone.sizes"
        case .detectLang: "globe"
        case .lowPowerMode: "battery.25percent"
        }
    }
}
