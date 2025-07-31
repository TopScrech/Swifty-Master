import SwiftUI

struct TopicLinkLabel: View {
    @EnvironmentObject private var store: ValueStore
    
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    private var isAvailable: Bool {
        topicView(topic) != nil
    }
    
    var body: some View {
        HStack {
            Label {
                Text(topic.name)
                
                if !isAvailable {
                    Text("Coming soon...")
                }
            } icon: {
                Image(systemName: topic.icon)
                    .opacity(isAvailable ? 1 : 0.25)
                    .rotationEffect(.degrees(topic == .lazyVGrid ? 90 : 0))
            }
            .labelReservedIconWidth(16)
            
            if !isAvailable {
                Spacer()
                
                Image(systemName: "lock")
                    .secondary()
            }
        }
        .contextMenu {
            Button {
                store.addOrRemoveFavorite(topic)
            } label: {
                if store.favoriteTopics.contains(topic) {
                    Label("Undo favorite", systemImage: "star.slash.fill")
                } else {
                    Label("Favorite", systemImage: "star")
                }
            }
            .tint(.yellow)
            
            if let url = topic.shareLink {
                ShareLink(item: url)
            }
        }
    }
}

#Preview {
    TopicLinkLabel(.spacer)
        .environmentObject(ValueStore())
}
