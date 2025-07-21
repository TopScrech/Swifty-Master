import SwiftUI

struct ContentView: View {
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        VStack(spacing: 25) {
            if let view = topicView(topic) {
                view
                    .padding(.horizontal)
            }
            
            TopicDocs(topic.docs)
        }
    }
}

func topicView(_ topic: Topic) -> AnyView? {
    switch topic {
        // Content
    case .text: AnyView(TopicText())
    case .textField: AnyView(TopicTextField())
    case .textEditor: AnyView(TopicTextEditor())
    case .image: AnyView(TopicImage())
        
        // View
    case .emptyView: AnyView(TopicEmptyView())
    case .appStoreOverlay: AnyView(AppStoreOverlay())
        
        // Nav
    case .dismiss: AnyView(TopicDismiss())
        
        // Layout
    case .spacer: AnyView(TopicSpacer())
        
        // Control
    case .toggle: AnyView(TopicToggle())
        
        // System
    case .detectDarkMode: AnyView(TopicDarkMode())
        
    default: nil
    }
}

//#Preview {
//    ContentView()
//}
