import SwiftUI

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
                    .swipeActions(edge: .leading) {
                        if store.favoriteTopics.contains(topic) {
                            Button {
                                store.addOrRemoveFavorite(topic)
                            } label: {
                                Image(systemName: "star.slash.fill")
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
                .onMove { here, there in
                    move(from: here, to: there)
                }
            } else {
                ContentUnavailableView("No favorites found", systemImage: "star")
            }
        }
        .navigationTitle("Favorites")
        .animation(.default, value: isEditing)
        .animation(.default, value: store.favoriteTopics)
        .toolbar {
            if store.favoriteTopics.count > 0 {
                if isEditing {
                    Button {
                        isEditing = false
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.blue)
                } else {
                    Button {
                        isEditing = true
                    } label: {
                        Image(systemName: "pencil")
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
