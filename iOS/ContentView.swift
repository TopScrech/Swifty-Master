import SwiftUI

struct ContentView: View {
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        switch topic {
        case .dismiss: TopicDismiss()
        default: EmptyView()
        }
    }
}

//#Preview {
//    ContentView()
//}
