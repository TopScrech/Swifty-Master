import ScrechKit

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    @State private var sheetSettings = false
    
    @AppStorage("last_tab") private var lastTab = 0
    
    var body: some View {
        @Bindable var nav = nav
        
        TabView(selection: $lastTab) {
            Tab("Topics", systemImage: "list.bullet", value: 0) {
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
                            SFButton("gear") {
                                sheetSettings = true
                            }
                        }
                    }
                    .sheet($sheetSettings) {
                        NavigationView {
                            SettingsView()
                        }
                    }
                }
            }
            
            Tab("Favorites", systemImage: "star", value: 1) {
                NavigationStack(path: $nav.topicPath) {
                    FavoritesList()
                }
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
