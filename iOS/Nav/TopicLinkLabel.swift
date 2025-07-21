import SwiftUI

struct TopicLinkLabel: View {
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
    }
}

#Preview {
    TopicLinkLabel(.spacer)
}
