import Foundation

struct TopicMetadata {
    let category: Category
    let icon: String
    let docs: [TopicDocType]
    let related: [Topic]
    let isSpecialExperience: Bool
    
    init(
        category: Category,
        icon: String,
        docs: [TopicDocType] = [],
        related: [Topic] = [],
        isSpecialExperience: Bool = false
    ) {
        self.category = category
        self.icon = icon
        self.docs = docs
        self.related = related
        self.isSpecialExperience = isSpecialExperience
    }
}

extension Topic {
    var metadata: TopicMetadata {
        switch self {
            // MARK: - Content
        case .text:
            TopicMetadata(
                category: .content,
                icon: "textformat",
                docs: [
                    TopicDocType("Text", url: "https://developer.apple.com/documentation/swiftui/text"),
                    TopicDocType("font(_:)", url: "https://developer.apple.com/documentation/swiftui/text/font(_:)"),
                    TopicDocType("fontDesign(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontdesign(_:)"),
                    TopicDocType("fontWeight(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontweight(_:)"),
                    TopicDocType("fontWidth(_:)", url: "https://developer.apple.com/documentation/swiftui/text/fontwidth(_:)")
                ]
            )
            
        case .textField:
            TopicMetadata(
                category: .content,
                icon: "keyboard",
                docs: [
                    TopicDocType("Text Field", url: "https://developer.apple.com/documentation/swiftui/textfield"),
                    TopicDocType("textFieldStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/textfieldstyle(_:)"),
                    TopicDocType("keyboardType(_:)", url: "https://developer.apple.com/documentation/swiftui/view/keyboardtype(_:)"),
                    TopicDocType("autocorrectiondisabled(_:)", url: "https://developer.apple.com/documentation/swiftui/view/autocorrectiondisabled(_:)"),
                    TopicDocType("Building rich SwiftUI text experiences", details: "iOS 26+", url: "https://developer.apple.com/documentation/swiftui/building-rich-swiftui-text-experiences", downloadURL: "https://docs-assets.developer.apple.com/published/af5124237a05/BuildingRichSwiftUITextExperiences.zip")
                ],
                related: [.textEditor]
            )
            
        case .textEditor:
            TopicMetadata(
                category: .content,
                icon: "square.and.pencil",
                docs: [
                    TopicDocType("Text Editor", url: "https://developer.apple.com/documentation/swiftui/texteditor"),
                    TopicDocType("init(text:selection:)", details: "iOS, macOS, visionOS 26+", url: "https://developer.apple.com/documentation/swiftui/texteditor/init(text:selection:)")
                ],
                related: [.textField]
            )
            
        case .image:
            TopicMetadata(
                category: .content,
                icon: "photo",
                docs: [
                    TopicDocType("Image", url: "https://developer.apple.com/documentation/swiftui/image"),
                    TopicDocType("Image(systemName:)", url: "https://developer.apple.com/documentation/swiftui/image/init(systemname:)"),
                    TopicDocType("SF Symbols macOS app", url: "https://developer.apple.com/sf-symbols")
                ],
                related: [.label]
            )
            
        case .sfSymbolsExplorer:
            TopicMetadata(
                category: .content,
                icon: "square.grid.2x2",
                isSpecialExperience: true
            )
            
        case .label:
            TopicMetadata(
                category: .content,
                icon: "character.textbox",
                related: [.image]
            )
            
        case .shape:
            TopicMetadata(
                category: .content,
                icon: "circle.on.square",
                docs: [
                    TopicDocType("Rectangle", url: "https://developer.apple.com/documentation/swiftui/rectangle"),
                    TopicDocType("RoundedRectangle", url: "https://developer.apple.com/documentation/swiftui/roundedrectangle"),
                    TopicDocType("Circle", url: "https://developer.apple.com/documentation/swiftui/circle"),
                    TopicDocType("Ellipse", url: "https://developer.apple.com/documentation/swiftui/ellipse"),
                    TopicDocType("ConcentricRectangle", details: "iOS, macOS, tvOS, watchOS, visionOS 26+", url: "https://developer.apple.com/documentation/swiftui/concentricrectangle"),
                    TopicDocType("fill(_:style:)", url: "https://developer.apple.com/documentation/swiftui/shapeview/fill(_:style:)")
                ]
            )
            
        case .divider:
            TopicMetadata(
                category: .content,
                icon: "square.and.line.vertical.and.square",
                docs: [TopicDocType("Divider", url: "https://developer.apple.com/documentation/swiftui/divider")],
                related: [.spacer]
            )
            
            // MARK: - Control
        case .button:
            TopicMetadata(
                category: .control,
                icon: "digitalcrown.press",
                docs: [
                    TopicDocType("Button", url: "https://developer.apple.com/documentation/swiftui/button"),
                    TopicDocType("buttonStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/buttonstyle(_:)"),
                    TopicDocType("buttonBorderShape(_:)", url: "https://developer.apple.com/documentation/swiftui/view/buttonbordershape(_:)"),
                    TopicDocType("controlSize(_:)", details: "iOS, macOS, tvOS, watchOS, visionOS 26+", url: "https://developer.apple.com/documentation/swiftui/view/controlsize(_:)-rvbn")
                ]
            )
            
        case .menu:
            TopicMetadata(
                category: .control,
                icon: "filemenu.and.pointer.arrow",
                docs: [
                    TopicDocType("Menu", url: "https://developer.apple.com/documentation/swiftui/menu"),
                    TopicDocType("menuStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/menustyle(_:)")
                ],
                related: [.contextMenu]
            )
            
        case .contextMenu:
            TopicMetadata(
                category: .control,
                icon: "contextualmenu.and.pointer.arrow",
                docs: [TopicDocType("ContextMenu", url: "https://developer.apple.com/documentation/swiftui/view/contextmenu(menuitems:)")],
                related: [.menu]
            )
            
        case .toggle:
            TopicMetadata(
                category: .control,
                icon: "switch.2",
                docs: [
                    TopicDocType("Toggle", url: "https://developer.apple.com/documentation/swiftui/toggle"),
                    TopicDocType("Toggles", url: "https://developer.apple.com/design/human-interface-guidelines/toggles")
                ]
            )
            
        case .slider:
            TopicMetadata(
                category: .control,
                icon: "slider.horizontal.3",
                docs: [TopicDocType("Slider", url: "https://developer.apple.com/documentation/swiftui/slider")],
                related: [.stepper]
            )
            
        case .stepper:
            TopicMetadata(
                category: .control,
                icon: "plus.minus.capsule",
                docs: [TopicDocType("Stepper", url: "https://developer.apple.com/documentation/swiftui/stepper")],
                related: [.slider]
            )
            
        case .picker:
            TopicMetadata(
                category: .control,
                icon: "checklist",
                docs: [
                    TopicDocType("Picker", url: "https://developer.apple.com/documentation/swiftui/picker"),
                    TopicDocType("pickerStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/pickerstyle(_:)")
                ]
            )
            
        case .gauges:
            TopicMetadata(
                category: .control,
                icon: "gauge.open",
                docs: [
                    TopicDocType("Gauge", url: "https://developer.apple.com/documentation/swiftui/gauge"),
                    TopicDocType("gaugeStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/gaugestyle(_:)")
                ],
                related: [.progressView]
            )
            
        case .progressView:
            TopicMetadata(
                category: .control,
                icon: "progress.indicator",
                docs: [
                    TopicDocType("ProgressView", url: "https://developer.apple.com/documentation/swiftui/progressview"),
                    TopicDocType("progressViewStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/progressviewstyle(_:)")
                ],
                related: [.gauges]
            )
            
        case .badges:
            TopicMetadata(
                category: .control,
                icon: "app.badge",
                docs: [
                    TopicDocType("applicationIconBadgeNumber", details: "Deprecated: iOS 2.0-16.0", url: "https://developer.apple.com/documentation/uikit/uiapplication/applicationiconbadgenumber"),
                    TopicDocType("setBadgeCount(_:withCompletionHandler:)", url: "https://developer.apple.com/documentation/UserNotifications/UNUserNotificationCenter/setBadgeCount(_:withCompletionHandler:)")
                ],
                related: [.settingsAlternativeIcons]
            )
            
            // MARK: - View
        case .sheet:
            TopicMetadata(
                category: .view,
                icon: "square.stack",
                docs: [TopicDocType("sheet(item:onDismiss:content:)", url: "https://developer.apple.com/documentation/swiftui/view/sheet(item:onDismiss:content:)")]
            )
            
        case .popover:
            TopicMetadata(
                category: .view,
                icon: "questionmark.bubble",
                docs: [TopicDocType("popover(isPresented:attachmentAnchor:arrowEdge:content:)", url: "https://developer.apple.com/documentation/swiftui/view/popover(ispresented:attachmentanchor:arrowedge:content:)")]
            )
            
        case .alert:
            TopicMetadata(
                category: .view,
                icon: "exclamationmark.bubble",
                docs: [TopicDocType("alert(_:ispresented:actions:message:)", url: "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:message:)-6awwp")],
                related: [.confirmationDialog]
            )
            
        case .confirmationDialog:
            TopicMetadata(
                category: .view,
                icon: "checkmark.bubble",
                docs: [TopicDocType("confirmationDialog(_:isPresented:titleVisibility:actions:message:)", url: "https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:actions:message:)")],
                related: [.alert]
            )
            
        case .emptyView:
            TopicMetadata(
                category: .view,
                icon: "rectangle.dashed",
                docs: [TopicDocType("EmptyView", url: "https://developer.apple.com/documentation/swiftui/emptyview")]
            )
            
        case .appStoreOverlay:
            TopicMetadata(
                category: .view,
                icon: "apple.logo",
                docs: [
                    TopicDocType("appStoreOverlay(ispresented:configuration:)", url: "https://developer.apple.com/documentation/swiftui/view/appstoreoverlay(ispresented:configuration:)"),
                    TopicDocType("SKOverlay", url: "https://developer.apple.com/documentation/storekit/skoverlay")
                ]
            )
            
            // MARK: - Navigation
        case .dismiss:
            TopicMetadata(
                category: .navigation,
                icon: "chevron.backward.chevron.backward.dotted",
                docs: [TopicDocType("dismiss()", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss")]
            )
            
        case .navigationView:
            TopicMetadata(
                category: .navigation,
                icon: "macwindow",
                docs: [TopicDocType("NavigationView", details: "Deprecated: iOS 13.0-26.1", url: "https://developer.apple.com/documentation/swiftui/navigationview")]
            )
            
        case .navigationStack:
            TopicMetadata(
                category: .navigation,
                icon: "macwindow.on.rectangle",
                docs: [TopicDocType("NavigationStack", url: "https://developer.apple.com/documentation/swiftui/navigationstack")]
            )
            
        case .navigationSplitView:
            TopicMetadata(
                category: .navigation,
                icon: "sidebar.left",
                docs: [TopicDocType("NavigationSplitView", url: "https://developer.apple.com/documentation/swiftui/navigationsplitview")]
            )
            
        case .navigationBar:
            TopicMetadata(
                category: .navigation,
                icon: "menubar.arrow.up.rectangle",
                docs: [TopicDocType("toolbar(content:)", url: "https://developer.apple.com/documentation/swiftui/view/toolbar(content:)")]
            )
            
        case .navigationLink:
            TopicMetadata(
                category: .navigation,
                icon: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath",
                docs: [TopicDocType("NavigationLink", url: "https://developer.apple.com/documentation/swiftui/navigationlink")]
            )
            
        case .passAView:
            TopicMetadata(
                category: .navigation,
                icon: "inset.filled.trailinghalf.arrow.trailing.rectangle",
                docs: [TopicDocType("AnyView", url: "https://developer.apple.com/documentation/swiftui/anyview")]
            )
            
        case .link:
            TopicMetadata(
                category: .navigation,
                icon: "link",
                docs: [TopicDocType("Link", url: "https://developer.apple.com/documentation/swiftui/link")],
                related: [.shareLink]
            )
            
        case .shareLink:
            TopicMetadata(
                category: .navigation,
                icon: "square.and.arrow.up",
                docs: [
                    TopicDocType("ShareLink", url: "https://developer.apple.com/documentation/swiftui/sharelink"),
                    TopicDocType("SharePreview", url: "https://developer.apple.com/documentation/swiftui/sharepreview"),
                    TopicDocType("Transferable", url: "https://developer.apple.com/documentation/foundation/transferable")
                ],
                related: [.link]
            )
            
            // MARK: - Collections
        case .vStack:
            TopicMetadata(
                category: .collections,
                icon: "square.split.1x2",
                docs: [TopicDocType("VStack", url: "https://developer.apple.com/documentation/swiftui/vstack")],
                related: [.hStack]
            )
            
        case .hStack:
            TopicMetadata(
                category: .collections,
                icon: "square.split.2x1",
                docs: [TopicDocType("HStack", url: "https://developer.apple.com/documentation/swiftui/hstack")],
                related: [.vStack]
            )
            
        case .zStack:
            TopicMetadata(
                category: .collections,
                icon: "square.stack.3d.up",
                docs: [TopicDocType("ZStack", url: "https://developer.apple.com/documentation/swiftui/zstack")]
            )
            
        case .list:
            TopicMetadata(
                category: .collections,
                icon: "list.bullet.clipboard",
                docs: [TopicDocType("List", url: "https://developer.apple.com/documentation/swiftui/list")],
                related: [.scrollView, .swipeActions]
            )
            
        case .swipeActions:
            TopicMetadata(
                category: .collections,
                icon: "hand.draw",
                docs: [TopicDocType("swipeActions(edge:allowsFullSwipe:content:)", url: "https://developer.apple.com/documentation/swiftui/view/swipeactions(edge:allowsfullswipe:content:)")],
                related: [.list]
            )
            
        case .scrollView:
            TopicMetadata(
                category: .collections,
                icon: "scroll",
                docs: [TopicDocType("ScrollView", url: "https://developer.apple.com/documentation/swiftui/scrollview")],
                related: [.list]
            )
            
        case .grids:
            TopicMetadata(
                category: .collections,
                icon: "square.grid.3x3",
                docs: [
                    TopicDocType("Grid", url: "https://developer.apple.com/documentation/swiftui/grid"),
                    TopicDocType("LazyVGrid", url: "https://developer.apple.com/documentation/swiftui/lazyvgrid"),
                    TopicDocType("LazyHGrid", url: "https://developer.apple.com/documentation/swiftui/lazyhgrid")
                ]
            )
            
        case .tabView:
            TopicMetadata(
                category: .collections,
                icon: "platter.filled.bottom.iphone",
                docs: [TopicDocType("TabView", url: "https://developer.apple.com/documentation/swiftui/tabview")]
            )
            
            // MARK: - Layout
        case .spacer:
            TopicMetadata(
                category: .layout,
                icon: "space",
                docs: [TopicDocType("Spacer", url: "https://developer.apple.com/documentation/swiftui/spacer")],
                related: [.divider]
            )
            
        case .padding:
            TopicMetadata(
                category: .layout,
                icon: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right",
                docs: [TopicDocType("padding(_:_:)", url: "https://developer.apple.com/documentation/swiftui/view/padding(_:_:)")]
            )
            
        case .frame:
            TopicMetadata(
                category: .layout,
                icon: "photo.artframe",
                docs: [TopicDocType("frame(width:height:alignment:)", url: "https://developer.apple.com/documentation/swiftui/view/frame(width:height:alignment:)")]
            )
            
        case .geometryReader:
            TopicMetadata(
                category: .layout,
                icon: "arrow.up.and.down.and.arrow.left.and.right",
                docs: [TopicDocType("GeometryReader", url: "https://developer.apple.com/documentation/swiftui/geometryreader")]
            )
            
        case .equalSizeViews:
            TopicMetadata(
                category: .layout,
                icon: "rectangle.split.3x1"
            )
            
            // MARK: - Design
        case .color:
            TopicMetadata(
                category: .design,
                icon: "paintpalette",
                docs: [TopicDocType("Color", url: "https://developer.apple.com/documentation/swiftui/color")],
                related: [.gradient]
            )
            
        case .gradient:
            TopicMetadata(
                category: .design,
                icon: "app.translucent",
                docs: [
                    TopicDocType("Gradient", url: "https://developer.apple.com/documentation/swiftui/gradient"),
                    TopicDocType("LinearGradient", url: "https://developer.apple.com/documentation/swiftui/lineargradient"),
                    TopicDocType("RadialGradient", url: "https://developer.apple.com/documentation/swiftui/radialgradient"),
                    TopicDocType("AngularGradient", url: "https://developer.apple.com/documentation/swiftui/angulargradient"),
                    TopicDocType("EllipticGradient", url: "https://developer.apple.com/documentation/swiftui/ellipticalgradient")
                ],
                related: [.color]
            )
            
            // MARK: - System
        case .detectOSVersion:
            TopicMetadata(
                category: .system,
                icon: "waveform.path.ecg.magnifyingglass",
                docs: [
                    TopicDocType("UIUserInterfaceIdiom", url: "https://developer.apple.com/documentation/uikit/uiuserinterfaceidiom"),
                    TopicDocType("Running code on a specific platform or OS version", url: "https://developer.apple.com/documentation/xcode/running-code-on-a-specific-version")
                ]
            )
            
        case .detectDarkMode:
            TopicMetadata(
                category: .system,
                icon: "circle.righthalf.filled",
                docs: [TopicDocType("colorScheme", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme")]
            )
            
        case .detectScreenSize:
            TopicMetadata(
                category: .system,
                icon: "arrow.down.left.and.arrow.up.right.rectangle"
            )
            
        case .detectCompactOrRegular:
            TopicMetadata(
                category: .system,
                icon: "iphone.sizes"
            )
            
        case .detectLang:
            TopicMetadata(
                category: .system,
                icon: "globe",
                docs: [TopicDocType("preferredLocalizations", url: "https://developer.apple.com/documentation/foundation/bundle/preferredlocalizations")]
            )
            
        case .lowPowerMode:
            TopicMetadata(
                category: .system,
                icon: "battery.25percent",
                docs: [TopicDocType("isLowPowerModeEnabled", url: "https://developer.apple.com/documentation/foundation/processinfo/islowpowermodeenabled")],
                related: [.preventScreenSleep]
            )
            
        case .preventScreenSleep:
            TopicMetadata(
                category: .system,
                icon: "sun.max",
                docs: [TopicDocType("isIdleTimerDisabled", url: "https://developer.apple.com/documentation/uikit/uiapplication/1623129-isidletimerdisabled")],
                related: [.lowPowerMode, .preventScreenshots]
            )
            
        case .preventScreenshots:
            TopicMetadata(
                category: .system,
                icon: "iphone.slash",
                docs: [
                    TopicDocType("isSecureTextEntry", url: "https://developer.apple.com/documentation/uikit/uitextinputtraits/issecuretextentry"),
                    TopicDocType("UITextField", url: "https://developer.apple.com/documentation/uikit/uitextfield")
                ],
                related: [.preventScreenSleep]
            )
            
        case .settingsAlternativeIcons:
            TopicMetadata(
                category: .system,
                icon: "app.badge",
                docs: [
                    TopicDocType("setAlternateIconName(_:completionHandler:)", url: "https://developer.apple.com/documentation/uikit/uiapplication/setalternateiconname(_:completionhandler:)"),
                    TopicDocType("supportsAlternateIcons", url: "https://developer.apple.com/documentation/uikit/uiapplication/supportsalternateicons")
                ],
                related: [.badges]
            )
            
            // MARK: - New in Xcode 27
        case .differentiateOS:
            TopicMetadata(
                category: .newIniOS27,
                icon: "macbook.and.vision.pro"
            )
            
        case .enumPreview:
            TopicMetadata(
                category: .newIniOS27,
                icon: "list.bullet.rectangle"
            )
            
        case .reorderableContainers:
            TopicMetadata(
                category: .newIniOS27,
                icon: "arrow.up.arrow.down.square",
                docs: [
                    TopicDocType("reorderable()", url: "https://developer.apple.com/documentation/swiftui/dynamicviewcontent/reorderable()"),
                    TopicDocType("reorderContainer(for:isEnabled:move:)", url: "https://developer.apple.com/documentation/swiftui/view/reordercontainer(for:isenabled:move:)")
                ],
                related: [.list, .vStack, .grids]
            )
        }
    }
}
