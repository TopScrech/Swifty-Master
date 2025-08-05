import Foundation

extension Topic {
    var docs: [String: String] {
        switch self {
            // MARK: - Content
        case .text:
            ["Text": "https://developer.apple.com/documentation/swiftui/text"]
            
        case .textField:
            ["Text Field": "https://developer.apple.com/documentation/swiftui/textfield"]
            
        case .textEditor:
            [
                "Text Editor": "https://developer.apple.com/documentation/swiftui/texteditor",
                "init(text:selection:) (iOS 26)": "https://developer.apple.com/documentation/swiftui/texteditor/init(text:selection:)"
            ]
            
        case .image:
            ["Image": "https://developer.apple.com/documentation/swiftui/image"]
            
        case .divider:
            ["Divider": "https://developer.apple.com/documentation/swiftui/divider"]
            
        case .customKeyboard:
            ["keyboardtype(_:)": "https://developer.apple.com/documentation/swiftui/view/keyboardtype(_:)"]
            
            // MARK: - Control
        case .gauges:
            [
                "Gauge": "https://developer.apple.com/documentation/swiftui/gauge",
                "gaugestyle(_:)": "https://developer.apple.com/documentation/swiftui/view/gaugestyle(_:)"
            ]
            
        case .progressView:
            [
                "ProgressView": "https://developer.apple.com/documentation/swiftui/progressview",
                "progressviewstyle(_:)": "https://developer.apple.com/documentation/swiftui/view/progressviewstyle(_:)"
            ]
            
        case .button:
            [
                "Button": "https://developer.apple.com/documentation/swiftui/button",
                "buttonstyle(_:)": "https://developer.apple.com/documentation/swiftui/view/buttonstyle(_:)",
                "buttonbordershape(_:)": "https://developer.apple.com/documentation/swiftui/view/buttonbordershape(_:)"
            ]
            
        case .toggle:
            [
                "Toggle": "https://developer.apple.com/documentation/swiftui/toggle",
                "Toggles": "https://developer.apple.com/design/human-interface-guidelines/toggles"
            ]
            
        case .menu: [
            "Menu": "https://developer.apple.com/documentation/swiftui/menu",
            "menustyle(_:)": "https://developer.apple.com/documentation/swiftui/view/menustyle(_:)"
        ]
            
        case .slider:
            ["Slider": "https://developer.apple.com/documentation/swiftui/slider"]
            
        case .stepper:
            ["Stepper": "https://developer.apple.com/documentation/swiftui/stepper"]
            
        case .picker:
            [
                "Picker": "https://developer.apple.com/documentation/swiftui/picker",
                "pickerstyle(_:)": "https://developer.apple.com/documentation/swiftui/view/pickerstyle(_:)"
            ]
            
        case .contextMenu:
            ["ContextMenu": "https://developer.apple.com/documentation/swiftui/view/contextmenu(menuitems:)"]
            
            // MARK: - View
        case .sheet:
            ["sheet(item:onDismiss:content:)": "https://developer.apple.com/documentation/swiftui/view/sheet(item:onDismiss:content:)"]
            
        case .popover:
            ["popover(isPresented:attachmentAnchor:arrowEdge:content:)": "https://developer.apple.com/documentation/swiftui/view/popover(ispresented:attachmentanchor:arrowedge:content:)"]
            
        case .alert:
            ["alert(_:ispresented:actions:message:)-6awwp": "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:message:)-6awwp"]
            
        case .emptyView:
            ["EmptyView": "https://developer.apple.com/documentation/swiftui/emptyview"]
            
        case .appStoreOverlay:
            [
                "appstoreoverlay(ispresented:configuration:)": "https://developer.apple.com/documentation/swiftui/view/appstoreoverlay(ispresented:configuration:)",
                "SKOverlay": "https://developer.apple.com/documentation/storekit/skoverlay"
            ]
            
        case .badges:
            [
                "applicationIconBadgeNumber (Deprecated, iOS 2.0 - 16.0)": "https://developer.apple.com/documentation/uikit/uiapplication/applicationiconbadgenumber",
                "setBadgeCount(_:withCompletionHandler:)": "https://developer.apple.com/documentation/UserNotifications/UNUserNotificationCenter/setBadgeCount(_:withCompletionHandler:)"
            ]
            
            // MARK: - Nav
        case .dismiss:
            ["dismiss()": "https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss"]
            
        case .navigationView:
            ["NavigationView (Deprecated)": "https://developer.apple.com/documentation/swiftui/navigationview"]
            
        case .navigationStack:
            ["NavigationStack": "https://developer.apple.com/documentation/swiftui/navigationstack"]
            
        case .navigationSplitView:
            ["NavigationSplitView": "https://developer.apple.com/documentation/swiftui/navigationsplitview"]
            
        case .navigationLink:
            ["NavigationLink": "https://developer.apple.com/documentation/swiftui/navigationlink"]
            
        case .navigationBar:
            ["toolbar(content:)": "https://developer.apple.com/documentation/swiftui/view/toolbar(content:)"]
            
        case .passAView:
            ["AnyView": "https://developer.apple.com/documentation/swiftui/anyview"]
            
        case .link:
            ["Link": "https://developer.apple.com/documentation/swiftui/link"]
            
            // Collections
        case .vStack:
            ["VStack": "https://developer.apple.com/documentation/swiftui/vstack"]
            
        case .hStack:
            ["HStack": "https://developer.apple.com/documentation/swiftui/hstack"]
            
        case .zStack:
            ["ZStack": "https://developer.apple.com/documentation/swiftui/zstack"]
            
        case .grid:
            ["Grid": "https://developer.apple.com/documentation/swiftui/grid"]
            
        case .lazyVGrid:
            ["LazyVGrid": "https://developer.apple.com/documentation/swiftui/lazyvgrid"]
            
        case .lazyHGrid:
            ["LazyHGrid": "https://developer.apple.com/documentation/swiftui/lazyhgrid"]
            
        case .list:
            ["List": "https://developer.apple.com/documentation/swiftui/list"]
            
        case .scrollView:
            ["ScrollView": "https://developer.apple.com/documentation/swiftui/scrollview"]
            
        case .tabView:
            ["TabView": "https://developer.apple.com/documentation/swiftui/tabview"]
            
            // MARK: - Layout
        case .padding:
            ["padding(_:_:)": "https://developer.apple.com/documentation/swiftui/view/padding(_:_:)"]
            
        case .frame:
            ["frame(width:height:alignment:)": "https://developer.apple.com/documentation/swiftui/view/frame(width:height:alignment:)"]
            
        case .geometryReader:
            ["GeometryReader": "https://developer.apple.com/documentation/swiftui/geometryreader"]
            
        case .spacer:
            ["Spacer": "https://developer.apple.com/documentation/swiftui/spacer"]
            
            // MARK: - Color
        case .color:
            ["Color": "https://developer.apple.com/documentation/swiftui/color"]
            
        case .gradient:
            [
                "LinearGradient": "https://developer.apple.com/documentation/swiftui/lineargradient",
                "RadialGradient": "https://developer.apple.com/documentation/swiftui/radialgradient",
                "AngularGradient": "https://developer.apple.com/documentation/swiftui/angulargradient",
                "EllipticGradient": "https://developer.apple.com/documentation/swiftui/ellipticalgradient"
            ]
            
            // MARK: - System
        case .detectDarkMode:
            ["colorScheme": "https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme"]
            
        case .detectDeviceUsed:
            ["UIUserInterfaceIdiom": "https://developer.apple.com/documentation/uikit/uiuserinterfaceidiom"]
            
        case .detectLang:
            ["preferredLocalizations": "https://developer.apple.com/documentation/foundation/bundle/preferredlocalizations"]
            
        case .lowPowerMode:
            ["isLowPowerModeEnabled": "https://developer.apple.com/documentation/foundation/processinfo/islowpowermodeenabled"]
            
        default: [:]
        }
    }
}
