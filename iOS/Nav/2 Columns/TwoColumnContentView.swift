import ScrechKit

struct TwoColumnContentView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    private let categories = Category.allCases
    
    @State private var sheetSettings = false
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationSplitView(columnVisibility: $nav.columnVisibility) {
            List(categories, selection: $nav.selectedCategory) { category in
                NavigationLink(category.localizedName, value: category)
            }
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    SFButton("gear") {
                        sheetSettings = true
                    }
                }
            }
            .sheet($sheetSettings) {
                NavigationView {
                    SettingsView()
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
