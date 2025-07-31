import SwiftUI

struct StackTopicList: View {
    @Environment(DataModel.self) private var dataModel
    @EnvironmentObject private var store: ValueStore
    
    private let categories = Category.allCases
    
    var body: some View {
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
                                Image(systemName: "star.slash.fill")
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
}

#Preview {
    StackTopicList()
        .environment(DataModel())
        .environmentObject(ValueStore())
}
