import ScrechKit

struct SFSymbolsCategoryPicker: View {
    @Binding private var selectedCategory: String
    private let categories: [SFSymbolCategory]
    
    init(_ selectedCategory: Binding<String>, in categories: [SFSymbolCategory]) {
        _selectedCategory = selectedCategory
        self.categories = categories
    }
    
    private var selectedTitle: String {
        categories.first { $0.key == selectedCategory }?.title ?? "All"
    }
    
    var body: some View {
        Menu {
            ForEach(categories) { category in
                Button(category.title, systemImage: category.icon, action: {
                    selectedCategory = category.key
                })
            }
        } label: {
            Label(selectedTitle, systemImage: "line.3.horizontal.decrease.circle")
        }
        .buttonStyle(.bordered)
    }
}
