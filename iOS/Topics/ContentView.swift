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
    case .sfSymbols: AnyView(TopicSFSymbols())
    case .label: AnyView(TopicLabel())
    case .shape: AnyView(TopicShape())
    case .divider: AnyView(TopicDivider())
    case .customKeyboard: AnyView(TopicCustomKeyboard())
        
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
