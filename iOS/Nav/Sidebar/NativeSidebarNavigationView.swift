import ScrechKit

struct NativeSidebarNavigationView: View {
    @Environment(NavModel.self) private var nav
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationSplitView(columnVisibility: $nav.columnVisibility) {
            TopicSidebarPanel()
                .navigationTitle("Categories")
                .navContainerToolbar()
        } detail: {
            NavigationStack(path: $nav.topicPath) {
                CategoryTopicsView()
                    .navigationDestination(for: Topic.self) {
                        TopicDetail($0)
                    }
            }
        }
        .onAppear {
            nav.ensureSelectedCategory()
        }
        .onChange(of: nav.selectedCategory) {
            nav.clearTopicPathIfNeeded()
        }
    }
}

#Preview {
    NativeSidebarNavigationView()
        .darkSchemePreferred()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
