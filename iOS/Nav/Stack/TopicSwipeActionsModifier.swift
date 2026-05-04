import SwiftUI

struct TopicSwipeActionsModifier: ViewModifier {
    @EnvironmentObject private var store: ValueStore
    
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    func body(content: Content) -> some View {
#if os(tvOS)
        content
#else
        content
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
                        .labelStyle(.iconOnly)
                }
            }
#endif
    }
}

extension View {
    func topicSwipeActions(_ topic: Topic) -> some View {
        modifier(TopicSwipeActionsModifier(topic))
    }
}
