import SwiftUI

struct FavoritesList: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        List {
            if store.favoriteTopics.count > 0 {
                ForEach(store.favoriteTopics) { topic in
                    NavigationLink(value: topic) {
                        TopicLinkLabel(topic)
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
            }
        }
        .navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesList()
        .environmentObject(ValueStore())
}
