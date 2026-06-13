import ScrechKit

struct SFSymbolDetailView: View {
    let symbol: SFSymbolEntry
    
    var body: some View {
        List {
            Section {
                VStack {
                    Image(systemName: symbol.name)
                        .font(.largeTitle)
                        .symbolRenderingMode(.hierarchical)
                    
                    Text(symbol.name)
                        .selectableSymbolText()
                }
                .frame(maxWidth: .infinity)
            }
            
            Section("Metadata") {
                LabeledContent("Availability", value: symbol.availability)
                LabeledContent("Categories", value: symbol.categories.joined(separator: ", "))
                
                if !symbol.searchTerms.isEmpty {
                    LabeledContent("Search Terms", value: symbol.searchTerms.joined(separator: ", "))
                }
                
                if symbol.isRestricted {
                    Label("Restricted use", systemImage: "exclamationmark.triangle")
                        .foregroundStyle(.orange)
                }
            }
        }
        .navigationTitle(symbol.name)
    }
}
