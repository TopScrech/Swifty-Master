import ScrechKit

struct CategoryTopicsView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    private let columns = [
        GridItem(.adaptive(minimum: 240))
    ]
    
    var body: some View {
        @Bindable var dataModel = dataModel
        
        if let category = nav.selectedCategory {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(dataModel.topics(foundIn: category)) { topic in
                        NavigationLink(value: topic) {
                            TopicTile(topic)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle(category.localizedName)
            .searchable(text: $dataModel.searchPrompt)
            .scrollIndicators(.never)
        } else {
            Text("Choose a category")
                .navigationTitle("")
        }
    }
}

#Preview {
    NavigationStack {
        CategoryTopicsView()
    }
    .darkSchemePreferred()
    .environment(DataModel.shared)
    .environment(NavModel(selectedCategory: .content))
}
