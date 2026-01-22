import Foundation

struct TopicDocType: Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let details: String?
    let url: String
    let downloadURL: String?
    
    init(
        _ name: String,
        details: String? = nil,
        url: String,
        downloadURL: String? = nil
    ) {
        self.name = name
        self.details = details
        self.url = url
        self.downloadURL = downloadURL
    }
}

extension Topic {
    var docs: [TopicDocType] {
        switch self {
            // MARK: - Content
        case .text:
            [
                TopicDocType("Text", url: "https://developer.apple.com/documentation/swiftui/text"),
                TopicDocType("font(_:)", url: "https://developer.apple.com/documentation/swiftui/text/font(_:)"),
                TopicDocType("fontDesign(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontdesign(_:)"),
                TopicDocType("fontWeight(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontweight(_:)"),
                TopicDocType("fontWidth(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontwidth(_:)")
            ]
            
        case .textField:
            [
                TopicDocType("Text Field", url: "https://developer.apple.com/documentation/swiftui/textfield"),
                TopicDocType("textFieldStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/textfieldstyle(_:)"),
                TopicDocType("keyboardType(_:)", url: "https://developer.apple.com/documentation/swiftui/view/keyboardtype(_:)"),
                TopicDocType("Building rich SwiftUI text experiences", details: "iOS 26+", url: "https://developer.apple.com/documentation/swiftui/building-rich-swiftui-text-experiences", downloadURL: "https://docs-assets.developer.apple.com/published/af5124237a05/BuildingRichSwiftUITextExperiences.zip")
            ]
            
        case .textEditor:
            [
                TopicDocType("Text Editor", url: "https://developer.apple.com/documentation/swiftui/texteditor"),
                TopicDocType("init(text:selection:)", details: "iOS, macOS, visionOS 26+", url: "https://developer.apple.com/documentation/swiftui/texteditor/init(text:selection:)")
            ]
            
        case .shape:
            [
                TopicDocType("Rectangle", url: "https://developer.apple.com/documentation/swiftui/rectangle"),
                TopicDocType("RoundedRectangle", url: "https://developer.apple.com/documentation/swiftui/roundedrectangle"),
                TopicDocType("Circle", url: "https://developer.apple.com/documentation/swiftui/circle"),
                TopicDocType("Ellipse", url: "https://developer.apple.com/documentation/swiftui/ellipse"),
                TopicDocType("ConcentricRectangle", details: "iOS, macOS, tvOS, watchOS, visionOS 26+", url: "https://developer.apple.com/documentation/swiftui/concentricrectangle"),
                TopicDocType("fill(_:style:)", url: "https://developer.apple.com/documentation/swiftui/shapeview/fill(_:style:)")
            ]
            
            // MARK: - Image & Symbols
        case .image:
            [
                TopicDocType("Image", url: "https://developer.apple.com/documentation/swiftui/image"),
                TopicDocType("Image(systemName:)", url: "https://developer.apple.com/documentation/swiftui/image/init(systemname:)"),
                TopicDocType("SF Symbols macOS app", url: "https://developer.apple.com/sf-symbols")
            ]
            
        case .divider:
            [TopicDocType("Divider", url: "https://developer.apple.com/documentation/swiftui/divider")]
            
            // MARK: - Control
        case .gauges:
            [
                TopicDocType("Gauge", url: "https://developer.apple.com/documentation/swiftui/gauge"),
                TopicDocType("gaugeStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/gaugestyle(_:)")
            ]
            
        case .progressView:
            [
                TopicDocType("ProgressView", url: "https://developer.apple.com/documentation/swiftui/progressview"),
                TopicDocType("progressViewStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/progressviewstyle(_:)")
            ]
            
        case .button:
            [
                TopicDocType("Button", url: "https://developer.apple.com/documentation/swiftui/button"),
                TopicDocType("buttonStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/buttonstyle(_:)"),
                TopicDocType("buttonBorderShape(_:)", url: "https://developer.apple.com/documentation/swiftui/view/buttonbordershape(_:)"),
                TopicDocType("controlSize(_:)", details: "iOS, macOS, tvOS, watchOS, visionOS 26+", url: "https://developer.apple.com/documentation/swiftui/view/controlsize(_:)-rvbn")
            ]
            
        case .toggle:
            [
                TopicDocType("Toggle", url: "https://developer.apple.com/documentation/swiftui/toggle"),
                TopicDocType("Toggles", url: "https://developer.apple.com/design/human-interface-guidelines/toggles")
            ]
            
        case .menu:
            [
                TopicDocType("Menu", url: "https://developer.apple.com/documentation/swiftui/menu"),
                TopicDocType("menuStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/menustyle(_:)")
            ]
            
        case .slider:
            [TopicDocType("Slider", url: "https://developer.apple.com/documentation/swiftui/slider")]
            
        case .stepper:
            [TopicDocType("Stepper", url: "https://developer.apple.com/documentation/swiftui/stepper")]
            
        case .picker:
            [
                TopicDocType("Picker", url: "https://developer.apple.com/documentation/swiftui/picker"),
                TopicDocType("pickerStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/pickerstyle(_:)")
            ]
            
        case .contextMenu:
            [TopicDocType("ContextMenu", url: "https://developer.apple.com/documentation/swiftui/view/contextmenu(menuitems:)")]
            
            // MARK: - View
        case .sheet:
            [TopicDocType("sheet(item:onDismiss:content:)", url: "https://developer.apple.com/documentation/swiftui/view/sheet(item:onDismiss:content:)")]
            
        case .popover:
            [TopicDocType("popover(isPresented:attachmentAnchor:arrowEdge:content:)", url: "https://developer.apple.com/documentation/swiftui/view/popover(ispresented:attachmentanchor:arrowedge:content:)")]
            
        case .alert:
            [TopicDocType("alert(_:ispresented:actions:message:)", url: "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:message:)-6awwp")]
            
        case .confirmationDialog:
            [TopicDocType("confirmationDialog(_:isPresented:titleVisibility:actions:message:)", url: "https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:actions:message:)")]
            
        case .emptyView:
            [TopicDocType("EmptyView", url: "https://developer.apple.com/documentation/swiftui/emptyview")]
            
        case .appStoreOverlay:
            [
                TopicDocType("appStoreOverlay(ispresented:configuration:)", url: "https://developer.apple.com/documentation/swiftui/view/appstoreoverlay(ispresented:configuration:)"),
                TopicDocType("SKOverlay", url: "https://developer.apple.com/documentation/storekit/skoverlay")
            ]
            
        case .badges:
            [
                TopicDocType("applicationIconBadgeNumber", details: "Deprecated: iOS 2.0-16.0", url: "https://developer.apple.com/documentation/uikit/uiapplication/applicationiconbadgenumber"),
                TopicDocType("setBadgeCount(_:withCompletionHandler:)", url: "https://developer.apple.com/documentation/UserNotifications/UNUserNotificationCenter/setBadgeCount(_:withCompletionHandler:)")
            ]
            
            // MARK: - Navigation
        case .dismiss:
            [TopicDocType("dismiss()", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss")]
            
        case .navigationView:
            [TopicDocType("NavigationView", details: "Deprecated: iOS 13.0–26.1", url: "https://developer.apple.com/documentation/swiftui/navigationview")]
            
        case .navigationStack:
            [TopicDocType("NavigationStack", url: "https://developer.apple.com/documentation/swiftui/navigationstack")]
            
        case .navigationSplitView:
            [TopicDocType("NavigationSplitView", url: "https://developer.apple.com/documentation/swiftui/navigationsplitview")]
            
        case .navigationLink:
            [TopicDocType("NavigationLink", url: "https://developer.apple.com/documentation/swiftui/navigationlink")]
            
        case .navigationBar:
            [TopicDocType("toolbar(content:)", url: "https://developer.apple.com/documentation/swiftui/view/toolbar(content:)")]
            
        case .passAView:
            [TopicDocType("AnyView", url: "https://developer.apple.com/documentation/swiftui/anyview")]
            
        case .link:
            [TopicDocType("Link", url: "https://developer.apple.com/documentation/swiftui/link")]
            
        case .shareLink:
            [
                TopicDocType("ShareLink", url: "https://developer.apple.com/documentation/swiftui/sharelink"),
                TopicDocType("SharePreview", url: "https://developer.apple.com/documentation/swiftui/sharepreview"),
                TopicDocType("Transferable", url: "https://developer.apple.com/documentation/foundation/transferable")
            ]
            
            // MARK: - Collections
        case .vStack:
            [TopicDocType("VStack", url: "https://developer.apple.com/documentation/swiftui/vstack")]
            
        case .hStack:
            [TopicDocType("HStack", url: "https://developer.apple.com/documentation/swiftui/hstack")]
            
        case .zStack:
            [TopicDocType("ZStack", url: "https://developer.apple.com/documentation/swiftui/zstack")]
            
        case .grids:
            [
                TopicDocType("Grid", url: "https://developer.apple.com/documentation/swiftui/grid"),
                TopicDocType("LazyVGrid", url: "https://developer.apple.com/documentation/swiftui/lazyvgrid"),
                TopicDocType("LazyHGrid", url: "https://developer.apple.com/documentation/swiftui/lazyhgrid")
            ]
            
        case .list:
            [TopicDocType("List", url: "https://developer.apple.com/documentation/swiftui/list")]

        case .swipeActions:
            [TopicDocType("swipeActions(edge:allowsFullSwipe:content:)", url: "https://developer.apple.com/documentation/swiftui/view/swipeactions(edge:allowsfullswipe:content:)")]
            
        case .scrollView:
            [TopicDocType("ScrollView", url: "https://developer.apple.com/documentation/swiftui/scrollview")]
            
        case .tabView:
            [TopicDocType("TabView", url: "https://developer.apple.com/documentation/swiftui/tabview")]
            
            // MARK: - Layout
        case .padding:
            [TopicDocType("padding(_:_:)", url: "https://developer.apple.com/documentation/swiftui/view/padding(_:_:)")]
            
        case .frame:
            [TopicDocType("frame(width:height:alignment:)", url: "https://developer.apple.com/documentation/swiftui/view/frame(width:height:alignment:)")]
            
        case .geometryReader:
            [TopicDocType("GeometryReader", url: "https://developer.apple.com/documentation/swiftui/geometryreader")]
            
        case .spacer:
            [TopicDocType("Spacer", url: "https://developer.apple.com/documentation/swiftui/spacer")]
            
            // MARK: - Color
        case .color:
            [TopicDocType("Color", url: "https://developer.apple.com/documentation/swiftui/color")]
            
        case .gradient:
            [
                TopicDocType("Gradient", url: "https://developer.apple.com/documentation/swiftui/gradient"),
                TopicDocType("LinearGradient", url: "https://developer.apple.com/documentation/swiftui/lineargradient"),
                TopicDocType("RadialGradient", url: "https://developer.apple.com/documentation/swiftui/radialgradient"),
                TopicDocType("AngularGradient", url: "https://developer.apple.com/documentation/swiftui/angulargradient"),
                TopicDocType("EllipticGradient", url: "https://developer.apple.com/documentation/swiftui/ellipticalgradient")
            ]
            
            // MARK: - System
        case .detectDarkMode:
            [TopicDocType("colorScheme", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme")]
            
        case .detectOSVersion:
            [
                TopicDocType("UIUserInterfaceIdiom", url: "https://developer.apple.com/documentation/uikit/uiuserinterfaceidiom"),
                TopicDocType("Running code on a specific platform or OS version", url: "https://developer.apple.com/documentation/xcode/running-code-on-a-specific-version")
            ]
            
        case .detectLang:
            [TopicDocType("preferredLocalizations", url: "https://developer.apple.com/documentation/foundation/bundle/preferredlocalizations")]
            
        case .lowPowerMode:
            [TopicDocType("isLowPowerModeEnabled", url: "https://developer.apple.com/documentation/foundation/processinfo/islowpowermodeenabled")]
            
        case .preventScreenSleep:
            [TopicDocType("isIdleTimerDisabled", url: "https://developer.apple.com/documentation/uikit/uiapplication/1623129-isidletimerdisabled")]
            
        case .settingsAlternativeIcons:
            [
                TopicDocType("setAlternateIconName(_:completionHandler:)", url: "https://developer.apple.com/documentation/uikit/uiapplication/setalternateiconname(_:completionhandler:)"),
                TopicDocType("supportsAlternateIcons", url: "https://developer.apple.com/documentation/uikit/uiapplication/supportsalternateicons")
            ]
            
        default:
            []
        }
    }
}
