import ScrechKit

struct SFSymbolTile: View {
    let symbol: SFSymbolEntry
    
    var body: some View {
        VStack {
            Image(systemName: symbol.name)
                .font(.title)
                .symbolRenderingMode(.hierarchical)
                .frame(height: 36)
            
            Text(symbol.name)
                .font(.caption)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.center)
                .selectableSymbolText()
            
            if symbol.isRestricted {
                Image(systemName: "exclamationmark.triangle")
                    .font(.caption)
                    .foregroundStyle(.orange)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 96)
        .padding()
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 8))
    }
}
