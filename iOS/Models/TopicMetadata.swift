import Foundation

struct TopicMetadata {
    let title: String
    let category: Category
    let icon: String
    let docs: [TopicDocType]
    let related: [Topic]
    let isSpecialExperience: Bool
    
    init(
        title: String,
        category: Category,
        icon: String,
        docs: [TopicDocType] = [],
        related: [Topic] = [],
        isSpecialExperience: Bool = false
    ) {
        self.title = title
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
                title: "Text",
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
                title: "Text Field",
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
                title: "Text Editor",
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
                title: "Image",
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
                title: "SF Symbols Explorer",
                category: .content,
                icon: "square.grid.2x2",
                isSpecialExperience: true
            )
            
        case .label:
            TopicMetadata(
                title: "Label",
                category: .content,
                icon: "character.textbox",
                related: [.image]
            )
            
        case .shape:
            TopicMetadata(
                title: "Shape",
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
                title: "Divider",
                category: .content,
                icon: "square.and.line.vertical.and.square",
                docs: [TopicDocType("Divider", url: "https://developer.apple.com/documentation/swiftui/divider")],
                related: [.spacer]
            )
            
            // MARK: - Control
        case .button:
            TopicMetadata(
                title: "Button",
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
                title: "Menu",
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
                title: "Context Menu",
                category: .control,
                icon: "contextualmenu.and.pointer.arrow",
                docs: [TopicDocType("ContextMenu", url: "https://developer.apple.com/documentation/swiftui/view/contextmenu(menuitems:)")],
                related: [.menu]
            )
            
        case .toggle:
            TopicMetadata(
                title: "Toggle",
                category: .control,
                icon: "switch.2",
                docs: [
                    TopicDocType("Toggle", url: "https://developer.apple.com/documentation/swiftui/toggle"),
                    TopicDocType("Toggles", url: "https://developer.apple.com/design/human-interface-guidelines/toggles")
                ]
            )
            
        case .slider:
            TopicMetadata(
                title: "Slider",
                category: .control,
                icon: "slider.horizontal.3",
                docs: [TopicDocType("Slider", url: "https://developer.apple.com/documentation/swiftui/slider")],
                related: [.stepper]
            )
            
        case .stepper:
            TopicMetadata(
                title: "Stepper",
                category: .control,
                icon: "plus.minus.capsule",
                docs: [TopicDocType("Stepper", url: "https://developer.apple.com/documentation/swiftui/stepper")],
                related: [.slider]
            )
            
        case .picker:
            TopicMetadata(
                title: "Picker",
                category: .control,
                icon: "checklist",
                docs: [
                    TopicDocType("Picker", url: "https://developer.apple.com/documentation/swiftui/picker"),
                    TopicDocType("pickerStyle(_:)", url: "https://developer.apple.com/documentation/swiftui/view/pickerstyle(_:)")
                ]
            )
            
        case .gauges:
            TopicMetadata(
                title: "Gauges",
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
                title: "ProgressView",
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
                title: "Badges",
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
                title: "Sheet",
                category: .view,
                icon: "square.stack",
                docs: [TopicDocType("sheet(item:onDismiss:content:)", url: "https://developer.apple.com/documentation/swiftui/view/sheet(item:onDismiss:content:)")]
            )
            
        case .popover:
            TopicMetadata(
                title: "Popover",
                category: .view,
                icon: "questionmark.bubble",
                docs: [TopicDocType("popover(isPresented:attachmentAnchor:arrowEdge:content:)", url: "https://developer.apple.com/documentation/swiftui/view/popover(ispresented:attachmentanchor:arrowedge:content:)")]
            )
            
        case .alert:
            TopicMetadata(
                title: "Alert",
                category: .view,
                icon: "exclamationmark.bubble",
                docs: [TopicDocType("alert(_:ispresented:actions:message:)", url: "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:message:)-6awwp")],
                related: [.confirmationDialog]
            )
            
        case .confirmationDialog:
            TopicMetadata(
                title: "Confirmation Dialog",
                category: .view,
                icon: "checkmark.bubble",
                docs: [TopicDocType("confirmationDialog(_:isPresented:titleVisibility:actions:message:)", url: "https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:actions:message:)")],
                related: [.alert]
            )
            
        case .emptyView:
            TopicMetadata(
                title: "Empty View",
                category: .view,
                icon: "rectangle.dashed",
                docs: [TopicDocType("EmptyView", url: "https://developer.apple.com/documentation/swiftui/emptyview")]
            )
            
        case .appStoreOverlay:
            TopicMetadata(
                title: "App Store Overlay",
                category: .view,
                icon: "apple.logo",
                docs: [
                    TopicDocType("appStoreOverlay(ispresented:configuration:)", url: "https://developer.apple.com/documentation/swiftui/view/appstoreoverlay(ispresented:configuration:)"),
                    TopicDocType("SKOverlay", url: "https://developer.apple.com/documentation/storekit/skoverlay")
                ]
            )
            
        case .customViewModifiers:
            TopicMetadata(
                title: "Custom View Modifiers",
                category: .view,
                icon: "paintbrush.pointed",
                docs: [
                    TopicDocType("ViewModifier", url: "https://developer.apple.com/documentation/swiftui/viewmodifier"),
                    TopicDocType("modifier(_:)", url: "https://developer.apple.com/documentation/swiftui/view/modifier(_:)")
                ]
            )
            
            // MARK: - Navigation
        case .dismiss:
            TopicMetadata(
                title: "Dismiss",
                category: .navigation,
                icon: "chevron.backward.chevron.backward.dotted",
                docs: [TopicDocType("dismiss()", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss")]
            )
            
        case .navigationView:
            TopicMetadata(
                title: "Navigation View",
                category: .navigation,
                icon: "macwindow",
                docs: [TopicDocType("NavigationView", details: "Deprecated: iOS 13.0-26.1", url: "https://developer.apple.com/documentation/swiftui/navigationview")]
            )
            
        case .navigationStack:
            TopicMetadata(
                title: "Navigation Stack",
                category: .navigation,
                icon: "macwindow.on.rectangle",
                docs: [TopicDocType("NavigationStack", url: "https://developer.apple.com/documentation/swiftui/navigationstack")]
            )
            
        case .navigationSplitView:
            TopicMetadata(
                title: "Navigation Split View",
                category: .navigation,
                icon: "sidebar.left",
                docs: [TopicDocType("NavigationSplitView", url: "https://developer.apple.com/documentation/swiftui/navigationsplitview")]
            )
            
        case .navigationBar:
            TopicMetadata(
                title: "Navigation Bar",
                category: .navigation,
                icon: "menubar.arrow.up.rectangle",
                docs: [TopicDocType("toolbar(content:)", url: "https://developer.apple.com/documentation/swiftui/view/toolbar(content:)")]
            )
            
        case .navigationLink:
            TopicMetadata(
                title: "Navigation Link",
                category: .navigation,
                icon: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath",
                docs: [TopicDocType("NavigationLink", url: "https://developer.apple.com/documentation/swiftui/navigationlink")]
            )
            
        case .passAView:
            TopicMetadata(
                title: "Pass a View",
                category: .navigation,
                icon: "inset.filled.trailinghalf.arrow.trailing.rectangle",
                docs: [TopicDocType("AnyView", url: "https://developer.apple.com/documentation/swiftui/anyview")]
            )
            
        case .link:
            TopicMetadata(
                title: "Link",
                category: .navigation,
                icon: "link",
                docs: [TopicDocType("Link", url: "https://developer.apple.com/documentation/swiftui/link")],
                related: [.shareLink]
            )
            
        case .shareLink:
            TopicMetadata(
                title: "ShareLink",
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
                title: "VStack",
                category: .collections,
                icon: "square.split.1x2",
                docs: [TopicDocType("VStack", url: "https://developer.apple.com/documentation/swiftui/vstack")],
                related: [.hStack]
            )
            
        case .hStack:
            TopicMetadata(
                title: "HStack",
                category: .collections,
                icon: "square.split.2x1",
                docs: [TopicDocType("HStack", url: "https://developer.apple.com/documentation/swiftui/hstack")],
                related: [.vStack]
            )
            
        case .zStack:
            TopicMetadata(
                title: "ZStack",
                category: .collections,
                icon: "square.stack.3d.up",
                docs: [TopicDocType("ZStack", url: "https://developer.apple.com/documentation/swiftui/zstack")]
            )
            
        case .list:
            TopicMetadata(
                title: "List",
                category: .collections,
                icon: "list.bullet.clipboard",
                docs: [TopicDocType("List", url: "https://developer.apple.com/documentation/swiftui/list")],
                related: [.scrollView, .swipeActions]
            )
            
        case .swipeActions:
            TopicMetadata(
                title: "Swipe Actions",
                category: .collections,
                icon: "hand.draw",
                docs: [TopicDocType("swipeActions(edge:allowsFullSwipe:content:)", url: "https://developer.apple.com/documentation/swiftui/view/swipeactions(edge:allowsfullswipe:content:)")],
                related: [.list]
            )
            
        case .scrollView:
            TopicMetadata(
                title: "ScrollView",
                category: .collections,
                icon: "scroll",
                docs: [TopicDocType("ScrollView", url: "https://developer.apple.com/documentation/swiftui/scrollview")],
                related: [.list]
            )
            
        case .grids:
            TopicMetadata(
                title: "Grids",
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
                title: "TabView",
                category: .collections,
                icon: "platter.filled.bottom.iphone",
                docs: [TopicDocType("TabView", url: "https://developer.apple.com/documentation/swiftui/tabview")]
            )
            
            // MARK: - Layout
        case .spacer:
            TopicMetadata(
                title: "Spacer",
                category: .layout,
                icon: "space",
                docs: [TopicDocType("Spacer", url: "https://developer.apple.com/documentation/swiftui/spacer")],
                related: [.divider]
            )
            
        case .padding:
            TopicMetadata(
                title: "Padding",
                category: .layout,
                icon: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right",
                docs: [TopicDocType("padding(_:_:)", url: "https://developer.apple.com/documentation/swiftui/view/padding(_:_:)")]
            )
            
        case .frame:
            TopicMetadata(
                title: "Frame",
                category: .layout,
                icon: "photo.artframe",
                docs: [TopicDocType("frame(width:height:alignment:)", url: "https://developer.apple.com/documentation/swiftui/view/frame(width:height:alignment:)")]
            )
            
        case .geometryReader:
            TopicMetadata(
                title: "Geometry Reader",
                category: .layout,
                icon: "arrow.up.and.down.and.arrow.left.and.right",
                docs: [TopicDocType("GeometryReader", url: "https://developer.apple.com/documentation/swiftui/geometryreader")]
            )
            
        case .equalSizeViews:
            TopicMetadata(
                title: "Equal Size Views",
                category: .layout,
                icon: "rectangle.split.3x1"
            )
            
            // MARK: - Design
        case .color:
            TopicMetadata(
                title: "Color",
                category: .design,
                icon: "paintpalette",
                docs: [TopicDocType("Color", url: "https://developer.apple.com/documentation/swiftui/color")],
                related: [.gradient]
            )
            
        case .gradient:
            TopicMetadata(
                title: "Gradient",
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
                title: "Detect OS Version",
                category: .system,
                icon: "waveform.path.ecg.magnifyingglass",
                docs: [
                    TopicDocType("UIUserInterfaceIdiom", url: "https://developer.apple.com/documentation/uikit/uiuserinterfaceidiom"),
                    TopicDocType("Running code on a specific platform or OS version", url: "https://developer.apple.com/documentation/xcode/running-code-on-a-specific-version")
                ]
            )
            
        case .detectDarkMode:
            TopicMetadata(
                title: "Detect Dark Mode",
                category: .system,
                icon: "circle.righthalf.filled",
                docs: [TopicDocType("colorScheme", url: "https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme")]
            )
            
        case .detectScreenSize:
            TopicMetadata(
                title: "Detect Screen Size",
                category: .system,
                icon: "arrow.down.left.and.arrow.up.right.rectangle"
            )
            
        case .detectCompactOrRegular:
            TopicMetadata(
                title: "Detect Compact or Regular",
                category: .system,
                icon: "iphone.sizes"
            )
            
        case .detectLang:
            TopicMetadata(
                title: "Detect Language",
                category: .system,
                icon: "globe",
                docs: [TopicDocType("preferredLocalizations", url: "https://developer.apple.com/documentation/foundation/bundle/preferredlocalizations")]
            )
            
        case .lowPowerMode:
            TopicMetadata(
                title: "Low Power Mode",
                category: .system,
                icon: "battery.25percent",
                docs: [TopicDocType("isLowPowerModeEnabled", url: "https://developer.apple.com/documentation/foundation/processinfo/islowpowermodeenabled")],
                related: [.preventScreenSleep]
            )
            
        case .preventScreenSleep:
            TopicMetadata(
                title: "Prevent Screen Sleep",
                category: .system,
                icon: "sun.max",
                docs: [TopicDocType("isIdleTimerDisabled", url: "https://developer.apple.com/documentation/uikit/uiapplication/1623129-isidletimerdisabled")],
                related: [.lowPowerMode, .preventScreenshots]
            )
            
        case .preventScreenshots:
            TopicMetadata(
                title: "Prevent Screenshots",
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
                title: "Settings Alternative Icons",
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
                title: "Differentiate OS",
                category: .newIniOS27,
                icon: "macbook.and.vision.pro"
            )
            
        case .enumPreview:
            TopicMetadata(
                title: "Enum case Preview",
                category: .newIniOS27,
                icon: "list.bullet.rectangle"
            )
            
        case .reorderableContainers:
            TopicMetadata(
                title: "Reorderable Containers",
                category: .newIniOS27,
                icon: "arrow.up.arrow.down.square",
                docs: [
                    TopicDocType("reorderable()", url: "https://developer.apple.com/documentation/swiftui/dynamicviewcontent/reorderable()"),
                    TopicDocType("reorderContainer(for:isEnabled:move:)", url: "https://developer.apple.com/documentation/swiftui/view/reordercontainer(for:isenabled:move:)")
                ],
                related: [.list, .vStack, .grids]
            )
            
        case .swipeActionsInContainers:
            TopicMetadata(
                title: "Swipe Actions in Containers",
                category: .newIniOS27,
                icon: "hand.draw",
                docs: [
                    TopicDocType("swipeActions(edge:allowsFullSwipe:content:onPresentationChanged:)", url: "https://developer.apple.com/documentation/swiftui/view/swipeactions(edge:allowsfullswipe:content:onpresentationchanged:)"),
                    TopicDocType("swipeActionsContainer()", url: "https://developer.apple.com/documentation/swiftui/view/swipeactionscontainer()")
                ],
                related: [.swipeActions, .list, .scrollView]
            )
            
        case .asyncImageCaching:
            TopicMetadata(
                title: "AsyncImage Caching",
                category: .newIniOS27,
                icon: "photo",
                docs: [
                    TopicDocType("AsyncImage", url: "https://developer.apple.com/documentation/swiftui/asyncimage"),
                    TopicDocType("init(request:scale:transaction:content:)", url: "https://developer.apple.com/documentation/swiftui/asyncimage/init(request:scale:transaction:content:)")
                ],
                related: [.image]
            )
        }
    }
}
