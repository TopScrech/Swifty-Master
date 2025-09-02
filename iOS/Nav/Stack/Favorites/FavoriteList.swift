import ScrechKit

struct FavoriteList: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    @State private var isEditing = false
    
    var body: some View {
        List {
            ForEach(store.favoriteTopics) { topic in
                NavigationLink(value: topic) {
                    HStack {
                        TopicLinkLabel(topic)
                        
                        if isEditing {
                            Image(systemName: "line.3.horizontal")
                                .title2()
                                .secondary()
                        }
                    }
                }
                .topicSwipeActions(topic)
            }
            .onMove { here, there in
                move(from: here, to: there)
            }
        }
        .navigationTitle("Favorites")
        .animation(.default, value: isEditing)
        .animation(.default, value: store.favoriteTopics)
        .toolbar {
            if store.favoriteTopics.count > 0 {
                if isEditing {
                    SFButton("checkmark") {
                        isEditing = false
                    }
                    .glassProminentButtonStyle(.blue)
                } else {
                    SFButton("pencil") {
                        isEditing = true
                    }
                }
            }
        }
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
    
    private func move(from: IndexSet, to: Int) {
        store.favoriteTopics.move(fromOffsets: from, toOffset: to)
    }
}

#Preview {
    NavigationStack {
        FavoriteList()
    }
    .environmentObject(ValueStore())
    .environment(NavModel())
}
