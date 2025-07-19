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
            Content(
                topic: topic,
                relatedLink: relatedLink
            )
            .id(topic.id)
        } else {
            Text("Choose a topic")
                .navigationTitle("")
        }
    }
}

private struct Content<Link: View>: View {
    @Environment(DataModel.self) private var dataModel
    
    var topic: Topic
    var relatedLink: (Topic) -> Link
    
    var body: some View {
        ScrollView {
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
            
            HStack(alignment: .top, spacing: 20) {
                ingredients
                
                Spacer()
            }
            
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
            ingredients
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
    private var ingredients: some View {
        let padding = EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0)
        
        VStack(alignment: .leading) {
            Text("Ingredients")
                .title2(.bold)
                .padding(padding)
        }
        .frame(minWidth: 300, alignment: .leading)
    }
    
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
