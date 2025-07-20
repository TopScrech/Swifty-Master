import SwiftUI

struct ContentView: View {
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        switch topic {
        case .dismiss: TopicDismiss()
        case .appStoreOverlay: AppStoreOverlay()
        case .detectDarkMode: TopicDarkMode()
            
            // View
        case .emptyView: TopicEmptyView()
            
            // Layout
        case .spacer: TopicSpacer()
            
        default: EmptyView()
        }
    }
}

//#Preview {
//    ContentView()
//}
