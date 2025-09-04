import ScrechKit

struct TopicDetail: View {
    private let topic: Topic?
    
    init(_ topic: Topic?) {
        self.topic = topic
    }
    
    var body: some View {
        if let topic {
            Content(topic)
                .id(topic.id)
        } else {
            Text("Choose a topic")
                .navigationTitle("")
        }
    }
}

private struct Content: View {
    @Environment(DataModel.self) private var dataModel
    
    private let topic: Topic
    
    private let columns = [
        GridItem(.adaptive(minimum: 120, maximum: 120))
    ]
    
    init(_ topic: Topic) {
        self.topic = topic
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
        .navSubtitle(topic.category.localizedName)
    }
    
    private var wideDetails: some View {
        VStack(alignment: .leading) {
            title
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
}

#Preview {
    TopicDetail(.text)
        .environment(DataModel.shared)
}
