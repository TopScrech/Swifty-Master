import ScrechKit

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        
        TabView(selection: $store.lastTab) {
            NavigationStack(path: $nav.topicPath) {
                List {
                    StackTopicList()
                }
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
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: AppSettings()) {
                            Image(systemName: "gear")
                        }
                    }
                }
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
            .badge(store.favoriteArticlesBadge ? store.favoriteTopics.count : 0)
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
