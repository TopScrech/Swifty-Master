import ScrechKit

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        
        TabView(selection: $store.lastTab) {
            Tab("Topics", systemImage: "list.bullet", value: 0) {
                NavigationStack(path: $nav.topicPath) {
                    StackTopicList()
                        .navigationTitle("Categories")
                        .animation(.default, value: store.favoriteTopics)
                        .scrollIndicators(.never)
                        .navigationDestination(for: Topic.self) {
                            TopicDetail($0)
                        }
                        .navContainerToolbar()
                }
            }
            
            Tab("Favorites", systemImage: "star", value: 1) {
                NavigationStack(path: $nav.favoriteTopicPath) {
                    FavoriteListParent()
                        .navContainerToolbar()
                }
            }
#if !os(tvOS)
            .badge(store.favoriteArticlesBadge ? store.favoriteTopics.count : 0)
#endif
        }
    }
}

#Preview {
    StackContentView()
        .darkSchemePreferred()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
