import ScrechKit

struct CategoryTopicsView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    var body: some View {
        @Bindable var dataModel = dataModel
        
        if let category = nav.selectedCategory {
            List(dataModel.topics(foundIn: category)) { topic in
                NavigationLink(value: topic) {
                    Label(topic.localizedName, systemImage: topic.icon)
                }
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
