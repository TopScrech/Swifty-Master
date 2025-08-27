import ScrechKit

struct TwoColumnContentView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    private let categories = Category.allCases
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationSplitView(columnVisibility: $nav.columnVisibility) {
            List(categories, selection: $nav.selectedCategory) { category in
                NavigationLink(category.localizedName, value: category)
            }
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AppSettings()) {
                        Image(systemName: "gear")
                    }
                }
            }
        } detail: {
            NavigationStack(path: $nav.topicPath) {
                GridTopic()
            }
        }
    }
}

#Preview {
    TwoColumnContentView()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
}
