import SwiftUI

struct StackTopicList: View {
    @Environment(DataModel.self) private var dataModel
    
    var body: some View {
        @Bindable var dataModel = dataModel
        
        List {
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
