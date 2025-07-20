import SwiftUI

struct TopicDetail<Link: View>: View {
    private let topic: Topic?
    private let relatedLink: (Topic) -> Link
    
    init(
        _ topic: Topic?,
        relatedLink: @escaping (Topic) -> Link
    ) {
        self.topic = topic
        self.relatedLink = relatedLink
    }
    
    var body: some View {
        if let topic {
            Content(topic, relatedLink: relatedLink)
                .id(topic.id)
        } else {
            Text("Choose a topic")
                .navigationTitle("")
        }
    }
}

private struct Content<Link: View>: View {
    @Environment(NavModel.self) private var navModel
    @Environment(DataModel.self) private var dataModel
    
    private let topic: Topic
    private let relatedLink: (Topic) -> Link
    
    init(
        _ topic: Topic,
        relatedLink: @escaping (Topic) -> Link
    ) {
        self.topic = topic
        self.relatedLink = relatedLink
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ContentView(topic)
            
            ViewThatFits(in: .horizontal) {
                wideDetails
                narrowDetails
            }
            .scenePadding()
        }
        .navigationTitle(topic.name)
    }
    
    private var wideDetails: some View {
        VStack(alignment: .leading) {
            title
            relatedTopics
        }
    }
    
    @ViewBuilder
    private var narrowDetails: some View {
#if os(macOS)
        HStack {
            narrowDetailsContent
            
            Spacer()
        }
#else
        narrowDetailsContent
#endif
    }
    
    private var narrowDetailsContent: some View {
        VStack(alignment: narrowDetailsAlignment) {
            title
            relatedTopics
        }
    }
    
    private var narrowDetailsAlignment: HorizontalAlignment {
#if os(macOS)
        .leading
#else
        .center
#endif
    }
    
    @ViewBuilder
    private var title: some View {
#if os(macOS)
        Text(topic.name)
            .largeTitle(.bold)
#endif
    }
    
    private let columns = [
        GridItem(.adaptive(minimum: 120, maximum: 120))
    ]
    
    @ViewBuilder
    private var relatedTopics: some View {
        let padding = EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0)
        
        if !topic.related.isEmpty {
            VStack(alignment: .leading) {
                Text("Related Topics")
                    .title2(.bold)
                    .padding(padding)
                
                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    let relatedTopics = dataModel.topics(relatedTo: topic)
                    
                    ForEach(relatedTopics) { relatedTopic in
                        relatedLink(relatedTopic)
                    }
                }
            }
        }
    }
}

//#Preview {
//    TopicDetail(topic: .mock) { _ in
//        EmptyView()
//    }
//    .environment(DataModel.shared)
//}
