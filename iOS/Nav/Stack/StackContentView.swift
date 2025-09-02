import ScrechKit

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        
        TabView(selection: $store.lastTab) {
            NavigationStack(path: $nav.topicPath) {
                StackTopicList()
                    .navigationTitle("Categories")
                    .animation(.default, value: store.favoriteTopics)
                    .scrollIndicators(.never)
                    .navigationDestination(for: Topic.self) { topic in
                        TopicDetail(topic) { relatedTopic in
                            Button {
                                nav.topicPath.append(relatedTopic)
                            } label: {
                                TopicTile(relatedTopic)
                            }
                            .buttonStyle(.plain)
                        }
                    }
#if !os(maOS)
                    .toolbar {
                        NavigationLink(destination: AppSettings()) {
                            Image(systemName: "gear")
                        }
                    }
#endif
            }
            .tag(0)
            .tabItem {
                Label("Topics", systemImage: "list.bullet")
            }
            
            NavigationStack(path: $nav.favoriteTopicPath) {
                FavoritesList()
                    .navigationDestination(for: Topic.self) { topic in
                        TopicDetail(topic) { relatedTopic in
                            Button {
                                nav.topicPath.append(relatedTopic)
                            } label: {
                                TopicTile(relatedTopic)
                            }
                            .buttonStyle(.plain)
                        }
                    }
            }
#if !os(tvOS)
            .badge(store.favoriteArticlesBadge ? store.favoriteTopics.count : 0)
#endif
            .tag(1)
            .tabItem {
                Label("Favorites", systemImage: "star")
            }
        }
    }
}

#Preview {
    StackContentView()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
