import ScrechKit

struct StackTopicList: View {
    @Environment(DataModel.self) private var dataModel
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var dataModel = dataModel
        
        List {
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
            
            ForEach(dataModel.filteredCategories) { category in
                Section(category.localizedName) {
                    ForEach(dataModel.topics(foundIn: category)) { topic in
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
