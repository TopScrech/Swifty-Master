import ScrechKit

struct StackTopicList: View {
    @Environment(DataModel.self) private var dataModel
    @EnvironmentObject private var store: ValueStore
    
    private let promotedTopics = [Topic.sfSymbolsExplorer]
    
    var body: some View {
        @Bindable var dataModel = dataModel
        let promotedTopicSet = Set(promotedTopics)
        
        List {
            if let fanControlURL = URL(string: "https://fancontrol.dev?source=swifty-master") {
                AdView(title: "FanControl", subtitle: "Keep Your Mac Cool and Quiet", url: fanControlURL)
            }
            
            let visiblePromotedTopics = promotedTopics.filter {
                dataModel.searchPrompt.isEmpty || $0.name.localizedStandardContains(dataModel.searchPrompt)
            }
            
            if !visiblePromotedTopics.isEmpty {
                Section {
                    ForEach(visiblePromotedTopics) { topic in
                        NavigationLink(value: topic) {
                            TopicLinkLabel(topic)
                        }
                        .topicSwipeActions(topic)
                    }
                }
            }
            
            if store.favoriteTopics.count > 0 {
                Section("Favorites") {
                    ForEach(store.favoriteTopics) { topic in
                        NavigationLink(value: topic) {
                            TopicLinkLabel(topic)
                        }
                        .topicSwipeActions(topic)
                    }
                }
            }
            
            ForEach(dataModel.filteredCategories(excluding: promotedTopicSet)) { category in
                Section(category.localizedName) {
                    ForEach(dataModel.topics(foundIn: category, excluding: promotedTopicSet)) { topic in
                        NavigationLink(value: topic) {
                            TopicLinkLabel(topic)
                        }
                        .topicSwipeActions(topic)
                    }
                }
            }
        }
        .searchable(text: $dataModel.searchPrompt)
        .animation(.default, value: dataModel.searchPrompt)
    }
}

#Preview {
    StackTopicList()
        .darkSchemePreferred()
        .environment(DataModel())
        .environment(NavModel())
        .environmentObject(ValueStore())
}
