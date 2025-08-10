import Foundation

struct TopicDocType: Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let url: String
    
    init(_ name: String, url: String) {
        self.name = name
        self.url = url
    }
}

extension Topic {
    var docs: [TopicDocType] {
        switch self {
            // MARK: - Content
        case .text:
            [
                TopicDocType("Text", url: "https://developer.apple.com/documentation/swiftui/text"),
                .init("font(_:)", url: "https://developer.apple.com/documentation/swiftui/text/font(_:)"),
                .init("fontDesign(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontdesign(_:)"),
                .init("fontWeight(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontweight(_:)"),
                .init("fontWidth(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontwidth(_:)")
            ]
            
        case .textField:
            [
                .init("Text Field", url: "https://developer.apple.com/documentation/swiftui/textfield"),
                .init("textFieldStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/textfieldstyle(_:)"),
                .init("keyboardType(_:)", url: "https://developer.apple.com/documentation/swiftui/view/keyboardtype(_:)"),
                .init("Building rich SwiftUI text experiences (iOS 26)", url: "https://developer.apple.com/documentation/swiftui/building-rich-swiftui-text-experiences")
            ]
            
        case .textEditor:
            [
                .init("Text Editor", url: "https://developer.apple.com/documentation/swiftui/texteditor"),
                .init("init(text:selection:) (iOS 26)", url: "https://developer.apple.com/documentation/swiftui/texteditor/init(text:selection:)")
            ]
            
            // MARK: - Image & Symbols
        case .image:
            [.init("Image", url: "https://developer.apple.com/documentation/swiftui/image")]
            
        case .sfSymbols:
            [.init("Image(systemName:)", url: "https://developer.apple.com/documentation/swiftui/image/init(systemname:)")]
            
        case .divider:
            [.init("Divider", url: "https://developer.apple.com/documentation/swiftui/divider")]
            
            // MARK: - Control
        case .gauges:
            [
                .init("Gauge", url: "https://developer.apple.com/documentation/swiftui/gauge"),
                .init("gaugeStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/gaugestyle(_:)")
            ]
            
        case .progressView:
            [
                .init("ProgressView", url: "https://developer.apple.com/documentation/swiftui/progressview"),
                .init("progressViewStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/progressviewstyle(_:)")
            ]
            
        case .button:
            [
                .init("Button", url: "https://developer.apple.com/documentation/swiftui/button"),
                .init("buttonStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/buttonstyle(_:)"),
                .init("buttonBorderShape(_:)", url: "https://developer.apple.com/documentation/swiftui/view/buttonbordershape(_:)"),
                .init("controlSize(_:) (iOS 26+)", url: "https://developer.apple.com/documentation/swiftui/view/controlsize(_:)-rvbn")
            ]
            
        case .toggle:
            [
                .init("Toggle", url: "https://developer.apple.com/documentation/swiftui/toggle"),
                .init("Toggles", url: "https://developer.apple.com/design/human-interface-guidelines/toggles")
            ]
            
        case .menu:
            [
                .init("Menu", url: "https://developer.apple.com/documentation/swiftui/menu"),
                .init("menuStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/menustyle(_:)")
            ]
            
        case .slider:
            [.init("Slider", url: "https://developer.apple.com/documentation/swiftui/slider")]
            
        case .stepper:
            [.init("Stepper", url: "https://developer.apple.com/documentation/swiftui/stepper")]
            
        case .picker:
            [
                .init("Picker", url: "https://developer.apple.com/documentation/swiftui/picker"),
                .init("pickerStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/pickerstyle(_:)")
            ]
            
        case .contextMenu:
            [.init("ContextMenu", url: "https://developer.apple.com/documentation/swiftui/view/contextmenu(menuitems:)")]
            
            // MARK: - View
        case .sheet:
            [.init("sheet(item:onDismiss:content:)", url: "https://developer.apple.com/documentation/swiftui/view/sheet(item:onDismiss:content:)")]
            
        case .popover:
            [.init("popover(isPresented:attachmentAnchor:arrowEdge:content:)", url: "https://developer.apple.com/documentation/swiftui/view/popover(ispresented:attachmentanchor:arrowedge:content:)")]
            
        case .alert:
            [.init("alert(_:ispresented:actions:message:)", url: "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:message:)-6awwp")]
            
        case .emptyView:
            [.init("EmptyView", url: "https://developer.apple.com/documentation/swiftui/emptyview")]
            
        case .appStoreOverlay:
            [
                .init("appStoreOverlay(ispresented:configuration:)", url: "https://developer.apple.com/documentation/swiftui/view/appstoreoverlay(ispresented:configuration:)"),
                .init("SKOverlay", url: "https://developer.apple.com/documentation/storekit/skoverlay")
            ]
            
        case .badges:
            [
                .init("applicationIconBadgeNumber (Deprecated, iOS 2.0 - 16.0)", url: "https://developer.apple.com/documentation/uikit/uiapplication/applicationiconbadgenumber"),
                .init("setBadgeCount(_:withCompletionHandler:)", url: "https://developer.apple.com/documentation/UserNotifications/UNUserNotificationCenter/setBadgeCount(_:withCompletionHandler:)")
            ]
            
            // MARK: - Navigation
        case .dismiss:
            [.init("dismiss()", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss")]
            
        case .navigationView:
            [.init("NavigationView (Deprecated)", url: "https://developer.apple.com/documentation/swiftui/navigationview")]
            
        case .navigationStack:
            [.init("NavigationStack", url: "https://developer.apple.com/documentation/swiftui/navigationstack")]
            
        case .navigationSplitView:
            [.init("NavigationSplitView", url: "https://developer.apple.com/documentation/swiftui/navigationsplitview")]
            
        case .navigationLink:
            [.init("NavigationLink", url: "https://developer.apple.com/documentation/swiftui/navigationlink")]
            
        case .navigationBar:
            [.init("toolbar(content:)", url: "https://developer.apple.com/documentation/swiftui/view/toolbar(content:)")]
            
        case .passAView:
            [.init("AnyView", url: "https://developer.apple.com/documentation/swiftui/anyview")]
            
        case .link:
            [.init("Link", url: "https://developer.apple.com/documentation/swiftui/link")]
            
            // MARK: - Collections
        case .vStack:
            [.init("VStack", url: "https://developer.apple.com/documentation/swiftui/vstack")]
            
        case .hStack:
            [.init("HStack", url: "https://developer.apple.com/documentation/swiftui/hstack")]
            
        case .zStack:
            [.init("ZStack", url: "https://developer.apple.com/documentation/swiftui/zstack")]
            
        case .grids:
            [
                .init("Grid", url: "https://developer.apple.com/documentation/swiftui/grid"),
                .init("LazyVGrid", url: "https://developer.apple.com/documentation/swiftui/lazyvgrid"),
                .init("LazyHGrid", url: "https://developer.apple.com/documentation/swiftui/lazyhgrid")
            ]
            
        case .list:
            [.init("List", url: "https://developer.apple.com/documentation/swiftui/list")]
            
        case .scrollView:
            [.init("ScrollView", url: "https://developer.apple.com/documentation/swiftui/scrollview")]
            
        case .tabView:
            [.init("TabView", url: "https://developer.apple.com/documentation/swiftui/tabview")]
            
            // MARK: - Layout
        case .padding:
            [.init("padding(_:_:)", url: "https://developer.apple.com/documentation/swiftui/view/padding(_:_:)")]
            
        case .frame:
            [.init("frame(width:height:alignment:)", url: "https://developer.apple.com/documentation/swiftui/view/frame(width:height:alignment:)")]
            
        case .geometryReader:
            [.init("GeometryReader", url: "https://developer.apple.com/documentation/swiftui/geometryreader")]
            
        case .spacer:
            [.init("Spacer", url: "https://developer.apple.com/documentation/swiftui/spacer")]
            
            // MARK: - Color
        case .color:
            [.init("Color", url: "https://developer.apple.com/documentation/swiftui/color")]
            
        case .gradient:
            [
                .init("Gradient", url: "https://developer.apple.com/documentation/swiftui/gradient"),
                .init("LinearGradient", url: "https://developer.apple.com/documentation/swiftui/lineargradient"),
                .init("RadialGradient", url: "https://developer.apple.com/documentation/swiftui/radialgradient"),
                .init("AngularGradient", url: "https://developer.apple.com/documentation/swiftui/angulargradient"),
                .init("EllipticGradient", url: "https://developer.apple.com/documentation/swiftui/ellipticalgradient")
            ]
            
            // MARK: - System
        case .detectDarkMode:
            [.init("colorScheme", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme")]
            
#warning("Add more")
        case .detectOSVersion: [
            .init("UIUserInterfaceIdiom", url: "https://developer.apple.com/documentation/uikit/uiuserinterfaceidiom")
        ]
            
        case .detectLang:
            [.init("preferredLocalizations", url: "https://developer.apple.com/documentation/foundation/bundle/preferredlocalizations")]
            
        case .lowPowerMode:
            [.init("isLowPowerModeEnabled", url: "https://developer.apple.com/documentation/foundation/processinfo/islowpowermodeenabled")]
            
        default:
            []
        }
    }
}
