import SwiftUI

struct ContentViewNavButtons: View {
    @EnvironmentObject private var store: ValueStore
    @Environment(NavModel.self) private var navModel
    
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
#if DEBUG
        HStack {
            if store.lastTab == 0 {
                let topics = Topic.allCases
                let index = topics.firstIndex(of: topic)
                
                if let index, index != 0 {
                    Button {
                        let nextTopic = topics[index - 1]
                        navModel.topicPath = [nextTopic]
                    } label: {
                        Image(systemName: "arrow.backward")
                    }
                }
                
                if let index, topics.count > index + 1 {
                    Button {
                        let nextTopic = topics[index + 1]
                        navModel.topicPath = [nextTopic]
                    } label: {
                        Image(systemName: "arrow.forward")
                    }
                }
            } else {
                let topics = store.favoriteTopics
                let index = topics.firstIndex(of: topic)
                
                if let index, index != 0 {
                    Button {
                        let nextTopic = topics[index - 1]
                        navModel.favoriteTopicPath = [nextTopic]
                    } label: {
                        Image(systemName: "arrow.backward")
                    }
                }
                
                if let index, store.favoriteTopics.count > index + 1 {
                    Button {
                        let nextTopic = topics[index + 1]
                        navModel.favoriteTopicPath = [nextTopic]
                    } label: {
                        Image(systemName: "arrow.forward")
                    }
                }
            }
        }
        .buttonStyle(.bordered)
#endif
    }
}

//#Preview {
//    ContentViewNavButtons()
//}
