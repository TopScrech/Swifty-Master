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
        default: []
        }
    }
    
    var icon: String {
        switch self {
        case .text: "textformat.characters"
        case .textField: "character.cursor.ibeam"
        case .textEditor: "square.and.pencil"
        case .image: "photo"
        case .sfSymbols: "environments"
        case .label: "character.textbox"
        case .shape: "circle.on.square"
        case .divider: "square.filled.and.line.vertical.and.square"
        case .customKeyboard: "keyboard"
        case .button: "character.textbox"
        case .menu: "filemenu.and.pointer.arrow"
        case .contextMenu: "contextualmenu.and.pointer.arrow"
        case .toggle: "checkmark.circle"
        case .slider: "slider.horizontal.3"
        case .stepper: "plus.minus.capsule.fill"
        case .picker: "checklist"
        case .sheet: ""
        case .popover: ""
        case .alert: "exclamationmark.bubble"
        case .emptyView: "rectangle.dashed"
        case .appStoreOverlay: "apple.logo"
        case .dismiss: "chevron.backward.chevron.backward.dotted"
        case .navigationView: ""
        case .navigationStack: ""
        case .navigationSplitView: ""
        case .navigationBar: ""
        case .navigationLink: ""
        case .passAView: ""
        case .link: "link"
        case .vStack: "square.split.1x2.fill"
        case .hStack: "square.split.2x1.fill"
        case .zStack: ""
        case .list: "list.bullet.clipboard"
        case .scrollView: "scroll"
        case .grid: "square.grid.3x3"
        case .lazyVGrid: ""
        case .lazyHGrid: ""
        case .tabView: "platter.filled.bottom.iphone"
        case .spacer: "space"
        case .padding: ""
        case .frame: "photo.artframe"
        case .positionPoint: ""
        case .geometryReader: "arrow.up.and.down.and.arrow.left.and.right"
        case .equalSizeViews: "rectangle.split.3x1"
        case .color: "paintpalette"
        case .gradient: "app.translucent"
        case .detectOSVersion: ""
        case .detectDarkMode: "circle.righthalf.filled"
        case .detectDeviceUsed: ""
        case .differentiateOS: "macbook.and.iphone"
        case .detectScreenSize: ""
        case .detectCompactOrRegular: ""
        case .detectLang: "text.magnifyingglass"
        }
    }
}
