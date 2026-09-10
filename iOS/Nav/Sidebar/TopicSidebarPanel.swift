import ScrechKit

struct TopicSidebarPanel: View {
    @Environment(NavModel.self) private var nav
    
    var onSelect: () -> Void = {}
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Categories")
                    .caption(.semibold)
                    .secondary()
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                
                VStack(alignment: .leading, spacing: 3) {
                    ForEach(Category.allCases) { category in
                        SidebarCategoryRow(
                            category: category,
                            isSelected: nav.selectedCategory == category
                        ) {
                            nav.selectCategory(category)
                            onSelect()
                        }
                    }
                }
            }
            .padding(12)
        }
        .scrollIndicators(.never)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    TopicSidebarPanel()
        .darkSchemePreferred()
        .environment(NavModel.shared)
}
