import ScrechKit

struct ContentViewNavButtons: View {
    @EnvironmentObject private var store: ValueStore
    @Environment(NavModel.self) private var navModel
    
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        HStack {
            if store.lastTab == 0 {
                let topics = Topic.allCases
                let index = topics.firstIndex(of: topic)
                
                if let index, index != 0 {
                    SFButton("arrow.backward") {
                        let nextTopic = topics[index - 1]
                        navModel.topicPath = [nextTopic]
                    }
                }
                
                if let index, topics.count > index + 1 {
                    SFButton("arrow.forward") {
                        let nextTopic = topics[index + 1]
                        navModel.topicPath = [nextTopic]
                    }
                }
            } else {
                let topics = store.favoriteTopics
                let index = topics.firstIndex(of: topic)
                
                if let index, index != 0 {
                    SFButton("arrow.backward") {
                        let nextTopic = topics[index - 1]
                        navModel.favoriteTopicPath = [nextTopic]
                    }
                }
                
                if let index, store.favoriteTopics.count > index + 1 {
                    SFButton("arrow.forward") {
                        let nextTopic = topics[index + 1]
                        navModel.favoriteTopicPath = [nextTopic]
                    }
                }
            }
        }
        .buttonStyle(.bordered)
    }
}

//#Preview {
//    ContentViewNavButtons()
//    .darkSchemePreferred()
//}
