import ScrechKit

struct TopicSFSymbolsExplorer: View {
    @State private var catalog: SFSymbolCatalog?
    @State private var searchText = ""
    @State private var selectedCategory = "all"
    @State private var renderingMode = SFSymbolRenderingMode.hierarchical
    
    private var filteredSymbols: [SFSymbolEntry] {
        guard let catalog else {
            return []
        }
        
        return catalog.symbols.filter {
            (selectedCategory == "all" || $0.categories.contains(selectedCategory)) &&
            $0.matches(searchText)
        }
    }
    
    var body: some View {
        SFSymbolsGrid(symbols: filteredSymbols, renderingMode: renderingMode)
            .toolbarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .task {
                await loadCatalog()
            }
            .searchable(text: $searchText, prompt: "Search symbols")
            .toolbar {
                ToolbarItem {
                    SFSymbolRenderingModePicker($renderingMode)
                }
                
                ToolbarItem {
                    if let catalog {
                        SFSymbolsCategoryPicker($selectedCategory, in: catalog.categories)
                    }
                }
            }
    }
    
    private func loadCatalog() async {
        guard catalog == nil else {
            return
        }
        
        catalog = await Task.detached(priority: .userInitiated) {
            SFSymbolCatalog.load()
        }.value
    }
}

#Preview {
    NavigationStack {
        TopicSFSymbolsExplorer()
            .darkSchemePreferred()
    }
}
