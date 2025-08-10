import SwiftUI

struct NavContainer: View {
    @EnvironmentObject private var store: ValueStore
    @Environment(\.scenePhase) private var scenePhase
    private var nav: NavModel = .shared
    private var dataModel: DataModel = .shared
    
#if os(macOS)
    @Environment(\.appearsActive) private var appearsActive
#endif
    
    var body: some View {
        @Bindable var nav = nav
        
        Group {
            switch store.experience {
            case .stack?:
                StackContentView()
                
            case .twoColumn?:
                TwoColumnContentView()
                
            case nil:
                NavModeButton()
                    .onAppear {
                        nav.showExperiencePicker = true
                    }
            }
        }
        .environment(nav)
        .environment(dataModel)
        .preferredColorScheme(store.colorTheme.scheme)
        .statusBarHidden(!store.showStatusBar)
        .task {
            nav.load()
        }
        .onChange(of: scenePhase) { _, newScenePhase in
            if newScenePhase == .background {
                nav.save()
            }
        }
#if os(macOS)
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
}

#Preview {
    NavContainer()
        .environmentObject(ValueStore())
}
