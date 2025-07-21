import SwiftUI

struct TopicLinkLabel: View {
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        HStack {
            Label {
                Text(topic.name)
            } icon: {
                Image(systemName: topic.icon)
                    .rotationEffect(.degrees(topic == .lazyVGrid ? 90 : 0))
            }
            .labelReservedIconWidth(16)
            
            if topicView(topic) == nil {
                Spacer()
                
                Image(systemName: "lock")
                    .secondary()
            }
        }
    }
}

#Preview {
    TopicLinkLabel(.spacer)
}
