import SwiftUI

struct NavContainer: View {
    @Environment(\.scenePhase) private var scenePhase
    private var nav: NavModel = .shared
    private var dataModel: DataModel = .shared
    
#if os(macOS)
    @Environment(\.appearsActive) private var appearsActive
#endif
    
    @AppStorage("experience") private var experience: Experience?
    
    var body: some View {
        @Bindable var nav = nav
        
        Group {
            switch experience {
            case .stack?:
                StackContentView()
                
            case .twoColumn?:
                TwoColumnContentView()
                
            case nil:
                ExperienceButton()
                    .onAppear {
                        nav.showExperiencePicker = true
                    }
            }
        }
        .environment(nav)
        .environment(dataModel)
        .sheet(isPresented: $nav.showExperiencePicker) {
            ExperiencePicker($experience)
        }
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
    }
}

#Preview {
    NavContainer()
}
