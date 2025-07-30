// A data model for a topic and its metadata, including its related topics

import SwiftUI

enum Topic: String, Identifiable, CaseIterable, Codable {
    // Content
    case text = "Text",
         textField = "Text Field",
         textEditor = "Text Editor",
         image = "Image",
         sfSymbols = "SF Symbols",
         label = "Label",
         shape = "Shape",
         divider = "Divider",
         customKeyboard = "Custom Keyboard",
         
         // Control
         button = "Button",
         menu = "Menu",
         contextMenu = "Context Menu",
         toggle = "Toggle",
         slider = "Slider",
         stepper = "Stepper",
         picker = "Picker",
         
         // View
         sheet = "Sheet",
         popover = "Popover",
         alert = "Alert",
         emptyView = "Empty View",
         appStoreOverlay = "App Store Overlay",
         
         // Navigation
         dismiss = "Dismiss",
         navigationView = "Navigation View",
         navigationStack = "Navigation Stack",
         navigationSplitView = "Navigation Split View",
         navigationBar = "Navigation Bar",
         navigationLink = "Navigation Link",
         passAView = "Pass a View",
         link = "Link",
         
         // Collections
         vStack = "VStack",
         hStack = "HStack",
         zStack = "ZStack",
         list = "List",
         scrollView = "ScrollView",
         grid = "Grid",
         lazyVGrid = "LazyVGrid",
         lazyHGrid = "LazyHGrid",
         tabView = "TabView",
         
         // Layout
         spacer = "Spacer",
         padding = "Padding",
         frame = "Frame",
         positionPoint = "Position Point",
         geometryReader = "Geometry Reader",
         equalSizeViews = "Equal Size Views",
         
         // Design
         color = "Color",
         gradient = "Gradient",
         
         // System
         detectOSVersion = "Detect OS Version",
         detectDarkMode = "Detect Dark Mode",
         detectDeviceUsed = "Detect Device Used",
         differentiateOS = "Differentiate OS",
         detectScreenSize = "Detect Screen Size",
         detectCompactOrRegular = "Detect Compact or Regular",
         detectLang = "Detect Language"
    
    var id: String {
        rawValue
    }
    
    var name: String {
        rawValue
    }
    
    var category: Category {
        switch self {
        case .text, .textField, .textEditor, .image, .sfSymbols, .label, .shape, .divider, .customKeyboard:
                .content
            
        case .button, .menu, .contextMenu, .toggle, .slider, .stepper, .picker:
                .control
            
        case .sheet, .popover, .alert, .emptyView, .appStoreOverlay:
                .view
            
        case .dismiss, .navigationView, .navigationStack, .navigationSplitView, .navigationBar, .navigationLink, .passAView, .link:
                .navigation
            
        case .vStack, .hStack, .zStack, .list, .scrollView, .grid, .lazyVGrid, .lazyHGrid, .tabView:
                .collections
            
        case .spacer, .padding, .frame, .positionPoint, .geometryReader, .equalSizeViews:
                .layout
            
        case .color, .gradient:
                .design
            
        case .detectOSVersion, .detectDarkMode, .detectDeviceUsed, .differentiateOS, .detectScreenSize, .detectCompactOrRegular, .detectLang:
                .system
        }
    }
    
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
            
        default: []
        }
    }
    
    var icon: String {
        switch self {
        case .text: "textformat"
        case .textField: "character.cursor.ibeam"
        case .textEditor: "square.and.pencil"
        case .image: "photo"
        case .sfSymbols: "environments"
        case .label: "character.textbox"
        case .shape: "circle.on.square"
        case .divider: "square.and.line.vertical.and.square"
        case .customKeyboard: "keyboard"
        case .button: "digitalcrown.press"
        case .menu: "filemenu.and.pointer.arrow"
        case .contextMenu: "contextualmenu.and.pointer.arrow"
        case .toggle: "switch.2"
        case .slider: "slider.horizontal.3"
        case .stepper: "plus.minus.capsule"
        case .picker: "checklist"
        case .sheet: "square.stack"
        case .popover: "questionmark.bubble"
        case .alert: "exclamationmark.bubble"
        case .emptyView: "rectangle.dashed"
        case .appStoreOverlay: "apple.logo"
        case .dismiss: "chevron.backward.chevron.backward.dotted"
        case .navigationView: "macwindow"
        case .navigationStack: "macwindow.on.rectangle"
        case .navigationSplitView: "sidebar.left"
        case .navigationBar: "menubar.arrow.up.rectangle"
        case .navigationLink: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath"
        case .passAView: "inset.filled.trailinghalf.arrow.trailing.rectangle"
        case .link: "link"
        case .vStack: "square.split.1x2"
        case .hStack: "square.split.2x1"
        case .zStack: "square.stack.3d.up"
        case .list: "list.bullet.clipboard"
        case .scrollView: "scroll"
        case .grid: "square.grid.3x3"
        case .lazyVGrid: "square.grid.3x2"
        case .lazyHGrid: "square.grid.3x2"
        case .tabView: "platter.filled.bottom.iphone"
        case .spacer: "space"
        case .padding: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right"
        case .frame: "photo.artframe"
        case .positionPoint: "mappin.and.ellipse"
        case .geometryReader: "arrow.up.and.down.and.arrow.left.and.right"
        case .equalSizeViews: "rectangle.split.3x1"
        case .color: "paintpalette"
        case .gradient: "app.translucent"
        case .detectOSVersion: "waveform.path.ecg.magnifyingglass"
        case .detectDarkMode: "circle.righthalf.filled"
        case .detectDeviceUsed: "macbook.and.vision.pro"
        case .differentiateOS: "macbook.sizes"
        case .detectScreenSize: "arrow.down.left.and.arrow.up.right.rectangle"
        case .detectCompactOrRegular: "iphone.sizes"
        case .detectLang: "text.magnifyingglass"
        }
    }
    
    var docs: [String: String] {
        switch self {
        case .textEditor:
            ["Text Editor": "https://developer.apple.com/documentation/swiftui/texteditor"]
            
        case .appStoreOverlay:
            [
                "appstoreoverlay(ispresented:configuration:)": "https://developer.apple.com/documentation/swiftui/view/appstoreoverlay(ispresented:configuration:)",
                "SKOverlay": "https://developer.apple.com/documentation/storekit/skoverlay"
            ]
            
            // Content
        case .text:
            ["Text": "https://developer.apple.com/documentation/swiftui/text"]
            
            // Nav
        case .dismiss:
            ["dismiss()": "https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss"]
            
            // Control
        case .toggle:
            ["Toggle": "https://developer.apple.com/documentation/swiftui/toggle"]
            
            // Layout
        case .spacer:
            ["Spacer": "https://developer.apple.com/documentation/swiftui/spacer"]
            
        default: [:]
        }
    }
}
