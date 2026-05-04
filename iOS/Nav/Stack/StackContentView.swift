import ScrechKit

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationStack(path: $nav.topicPath) {
            StackTopicList()
                .navigationTitle("Categories")
                .animation(.default, value: store.favoriteTopics)
                .scrollIndicators(.never)
                .navigationDestination(for: Topic.self) {
                    TopicDetail($0)
                }
                .navContainerToolbar()
        }
    }
}

#Preview {
    StackContentView()
        .darkSchemePreferred()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
