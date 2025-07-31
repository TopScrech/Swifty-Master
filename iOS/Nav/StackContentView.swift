import ScrechKit

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    @EnvironmentObject private var store: ValueStore
    
    private let categories = Category.allCases
    
    @State private var sheetSettings = false
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationStack(path: $nav.topicPath) {
            List {
                ForEach(store.favoriteTopics) { topic in
                    NavigationLink(value: topic) {
                        TopicLinkLabel(topic)
                    }
                    .swipeActions(edge: .leading) {
                        if store.favoriteTopics.contains(topic) {
                            Button {
                                store.addOrRemoveFavorite(topic)
                            } label: {
                                Image(systemName: "star.fill")
                                    .tint(.red)
                            }
                        }
                    }
                    .swipeActions {
                        if let url = topic.shareLink {
                            ShareLink(item: url)
                        }
                    }
                }
                
                ForEach(categories) { category in
                    Section(category.localizedName) {
                        ForEach(dataModel.topics(in: category)) { topic in
                            NavigationLink(value: topic) {
                                TopicLinkLabel(topic)
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    store.addOrRemoveFavorite(topic)
                                } label: {
                                    if store.favoriteTopics.contains(topic) {
                                        Image(systemName: "star.fill")
                                            .tint(.red)
                                    } else {
                                        Image(systemName: "star")
                                            .tint(.yellow)
                                    }
                                }
                            }
                            .swipeActions {
                                if let url = topic.shareLink {
                                    ShareLink(item: url)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Categories")
            .animation(.default, value: store.favoriteTopics)
            .experienceToolbar()
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
}

#Preview {
    StackContentView()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
