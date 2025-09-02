import SwiftUI

struct StackTopicList: View {
    @Environment(DataModel.self) private var dataModel
    @EnvironmentObject private var store: ValueStore
    
    private let categories = Category.allCases
    
    var body: some View {
        List {
            ForEach(categories) { category in
                Section(category.localizedName) {
                    ForEach(dataModel.topics(in: category)) { topic in
                        NavigationLink(value: topic) {
                            TopicLinkLabel(topic)
                        }
                        .topicSwipeActions(topic)
                    }
                }
            }
        }
    }
}

#Preview {
    StackTopicList()
        .environment(DataModel())
        .environment(NavModel())
        .environmentObject(ValueStore())
}
