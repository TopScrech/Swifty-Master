import ScrechKit

struct GridTopic: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    private let columns = [
        GridItem(.adaptive(minimum: 240))
    ]
    
    var body: some View {
        if let category = nav.selectedCategory {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(dataModel.topics(in: category)) { topic in
                        NavigationLink(value: topic) {
                            TopicTile(topic)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle(category.localizedName)
            .navigationDestination(for: Topic.self) {
                TopicDetail($0)
            }
        } else {
            Text("Choose a category")
                .navigationTitle("")
        }
    }
}

#Preview {
    GridTopic()
        .darkSchemePreferred()
        .environment(DataModel.shared)
        .environment(NavModel(selectedCategory: .content))
}

#Preview {
    GridTopic()
        .darkSchemePreferred()
        .environment(DataModel.shared)
        .environment(NavModel(selectedCategory: nil))
}
