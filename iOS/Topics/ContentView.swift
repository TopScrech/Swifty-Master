import ScrechKit

struct ContentView: View {
    @EnvironmentObject private var store: ValueStore
    
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        VStack(spacing: 25) {
            if let view = topicView(topic) {
                view
            }
            
            TopicDocs(topic.docs)
            
            ContentViewNavButtons(topic)
            
            ForEach(topic.related) { relatedTopic in
                NavigationLink(value: relatedTopic) {
                    Label {
                        Text(relatedTopic.name)
                    } icon: {
                        Image(systemName: relatedTopic.icon)
                            .foregroundStyle(.blue)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
                    .foregroundStyle(.foreground)
                }
            }
        }
        .scenePadding()
        .toolbar {
            Button {
                store.addOrRemoveFavorite(topic)
            } label: {
                if store.favoriteTopics.contains(topic) {
                    Image(systemName: "star.slash.fill")
                } else {
                    Image(systemName: "star")
                }
            }
            .foregroundStyle(.yellow)
#if !os(tvOS)
            if let url = topic.shareLink {
                ShareLink(item: url)
            }
#endif
        }
    }
}

func topicView(_ topic: Topic) -> AnyView? {
    switch topic {
        // Content
    case .text:       AnyView(TopicText())
    case .textField:  AnyView(TopicTextField())
    case .textEditor: AnyView(TopicTextEditor())
    case .image:      AnyView(TopicImage())
    case .label:      AnyView(TopicLabel())
    case .shape:      AnyView(TopicShape())
    case .divider:    AnyView(TopicDivider())
        
        // Control
    case .toggle:       AnyView(TopicToggle())
    case .button:       AnyView(TopicButton())
    case .menu:         AnyView(TopicMenu())
    case .contextMenu:  AnyView(TopicContextMenu())
    case .slider:       AnyView(TopicSlider())
    case .stepper:      AnyView(TopicStepper())
    case .picker:       AnyView(TopicPicker())
    case .progressView: AnyView(TopicProgressView())
#if !os(macOS) && !os(tvOS)
    case .gauges:       AnyView(TopicGauge())
    case .badges:       AnyView(TopicBadges())
#endif
        
        // View
    case .emptyView:       AnyView(TopicEmptyView())
    case .appStoreOverlay: AnyView(AppStoreOverlay())
    case .sheet:           AnyView(TopicSheet())
    case .alert:           AnyView(TopicAlert())
    case .confirmationDialog: AnyView(TopicConfirmationDialog())
    case .popover:         AnyView(TopicPopover())
        
        // Nav
    case .dismiss:             AnyView(TopicDismiss())
    case .navigationView:      AnyView(TopicNavigationView())
    case .navigationStack:     AnyView(TopicNavigationStack())
    case .navigationSplitView: AnyView(TopicNavigationSplitView())
    case .navigationBar:       AnyView(TopicNavigationBar())
    case .navigationLink:      AnyView(TopicNavigationLink())
    case .passAView:           AnyView(TopicPassAView())
    case .link:                AnyView(TopicLink())
    case .shareLink:           AnyView(TopicShareLink())
        
        // Collections
    case .vStack:     AnyView(TopicVStack())
    case .hStack:     AnyView(TopicHStack())
    case .zStack:     AnyView(TopicZStack())
    case .list:       AnyView(TopicList())
    case .swipeActions: AnyView(TopicSwipeActions())
    case .scrollView: AnyView(TopicScrollView())
    case .grids:      AnyView(TopicGrids())
    case .tabView:    AnyView(TopicTabView())
        
        // Layout
    case .spacer:         AnyView(TopicSpacer())
    case .padding:        AnyView(TopicPadding())
    case .frame:          AnyView(TopicFrame())
    case .geometryReader: AnyView(TopicGeometryReader())
    case .equalSizeViews: AnyView(TopicEqualSizeViews())
        
        // Design
    case .color:    AnyView(TopicColor())
    case .gradient: AnyView(TopicGradient())
        
        // System
    case .detectDarkMode:         AnyView(TopicDarkMode())
    case .detectOSVersion:        AnyView(TopicDetectOSVersion())
    case .lowPowerMode:           AnyView(TopicLowPowerMode())
    case .preventScreenSleep:     AnyView(TopicPreventScreenSleep())
    case .detectLang:             AnyView(TopicDetectLaguage())
    case .differentiateOS:        AnyView(TopicDifferentiateOS())
    case .detectScreenSize:       AnyView(TopicDetectScreenSize())
    case .detectCompactOrRegular: AnyView(TopicDetectCompactOrRegular())
    case .settingsAlternativeIcons: AnyView(TopicSettingsAlternativeIcons())
        
    @unknown default: nil
    }
}

#Preview {
    ContentView(.dismiss)
        .darkSchemePreferred()
        .environmentObject(ValueStore())
}
