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
                if store.favoriteTopics.contains(topic) {
                    SFButton("star.slash.fill") {
                        store.addOrRemoveFavorite(topic)
                    }
                    .tint(.red)
                }
            }
            .swipeActions {
                if let url = topic.shareLink {
                    ShareLink(item: url)
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
