import SwiftUI

struct TopicTile: View {
    private var topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    @State private var isHovering = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Label(topic.localizedName, systemImage: topic.icon)
                .lineLimit(2, reservesSpace: true)
        }
        .tint(.primary)
        .scaleEffect(scale)
#if !os(tvOS)
        .onHover {
            isHovering = $0
        }
#endif
    }
    
    private var scale: CGFloat {
        isHovering ? 1.05 : 1
    }
}

//#Preview {
//    TopicTile(.mock)
//    .darkSchemePreferred()
//}
