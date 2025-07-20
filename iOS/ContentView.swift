import SwiftUI

struct ContentView: View {
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        if let view = topicView(topic) {
            view
                .padding(.horizontal)
        }
    }
}

func topicView(_ topic: Topic) -> AnyView? {
    switch topic {
    case .dismiss: AnyView(TopicDismiss())
    case .appStoreOverlay: AnyView(AppStoreOverlay())
    case .detectDarkMode: AnyView(TopicDarkMode())
        
        // View
    case .emptyView: AnyView(TopicEmptyView())
        
        // Layout
    case .spacer: AnyView(TopicSpacer())
        
        // Control
    case .toggle: AnyView(TopicToggle())
        
    default: nil
    }
}

//#Preview {
//    ContentView()
//}
