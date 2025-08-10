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
         gauges = "Gauges",
         progressView = "ProgressView",
         badges = "Badges",
         
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
         lazyGrids = "Lazy Grids",
         tabView = "TabView",
         
         // Layout
         spacer = "Spacer",
         padding = "Padding",
         frame = "Frame",
         //         positionPoint = "Position Point",
         geometryReader = "Geometry Reader",
         equalSizeViews = "Equal Size Views",
         
         // Design
         color = "Color",
         gradient = "Gradient",
         
         // System
         detectOSVersion = "Detect OS Version",
         detectDarkMode = "Detect Dark Mode",
         differentiateOS = "Differentiate OS",
         detectScreenSize = "Detect Screen Size",
         detectCompactOrRegular = "Detect Compact or Regular",
         detectLang = "Detect Language",
         lowPowerMode = "Low Power Mode"
    
    var id: String {
        rawValue
    }
    
    var name: String {
        rawValue
    }
    
    var shareLink: URL? {
        if let url = URL(string: "https://swift-docs.dev/" + self.rawValue) {
            url
        } else {
            nil
        }
    }
}
