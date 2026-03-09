import ScrechKit

#if canImport(Appearance)
import Appearance
#endif

struct NavContainer: View {
    @Environment(NavModel.self) private var nav
    private var dataModel: DataModel = .shared
    
    @EnvironmentObject private var store: ValueStore
    @Environment(\.scenePhase) private var scenePhase
    
#if os(macOS)
    @Environment(\.appearsActive) private var appearsActive
#endif
    
    var body: some View {
        @Bindable var nav = nav
        
        Group {
            switch store.navMode {
            case .stack?:
                StackContentView()
                
            case .twoColumn?:
                TwoColumnContentView()
                
            case nil:
                NavModeButton()
                    .onAppear {
                        nav.showNavModePicker = true
                    }
            }
        }
        .environment(dataModel)
#if canImport(Appearance)
        .preferredColorScheme(store.appearance.scheme)
#endif
#if os(iOS)
        .statusBarHidden(!store.showStatusBar)
#endif
        .task {
            nav.load()
        }
        .onOpenURL {
            handleUniversalLink($0)
        }
        .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { activity in
            guard let url = activity.webpageURL else {
                return
            }
            
            handleUniversalLink(url)
        }
        .onChange(of: scenePhase) { _, newScenePhase in
            if newScenePhase == .background {
                nav.save()
            }
        }
#if os(macOS)
        .frame(minWidth: 600)
        .onChange(of: appearsActive) { _, appearsActive in
            if !appearsActive {
                nav.save()
            }
        }
#endif
        .onChange(of: nav.selectedCategory) {
            nav.save()
        }
        .onChange(of: nav.selectedTopic) {
            nav.save()
        }
        .onChange(of: nav.favoriteTopicPath) {
            nav.save()
        }
    }
    
    private func handleUniversalLink(_ url: URL) {
        guard let topic = Topic.topic(from: url) else {
            return
        }
        
        if store.navMode == nil {
            store.navMode = .stack
        }
        
        store.lastTab = 0
        nav.selectedCategory = topic.category
        nav.topicPath = [topic]
    }
}

#Preview {
    NavContainer()
        .darkSchemePreferred()
        .environmentObject(ValueStore())
}
