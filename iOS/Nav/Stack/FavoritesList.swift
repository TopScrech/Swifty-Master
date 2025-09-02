import ScrechKit

struct FavoritesList: View {
    @EnvironmentObject private var store: ValueStore
    
    @State private var isEditing = false
    
    var body: some View {
        List {
            if store.favoriteTopics.count > 0 {
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
            } else {
                ContentUnavailableView("No favorites found", systemImage: "star")
                    .frame(maxWidth: .infinity, alignment: .center)
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
                    .glassProminentButtonStyle()
                    .tint(.blue)
                } else {
                    SFButton("pencil") {
                        isEditing = true
                    }
                }
            }
        }
    }
    
    private func move(from: IndexSet, to: Int) {
        store.favoriteTopics.move(fromOffsets: from, toOffset: to)
    }
}

#Preview {
    FavoritesList()
        .environmentObject(ValueStore())
}
