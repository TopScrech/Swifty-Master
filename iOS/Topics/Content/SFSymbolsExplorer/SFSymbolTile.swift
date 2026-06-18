import ScrechKit

struct SFSymbolTile: View {
    let symbol: SFSymbolEntry
    let renderingMode: SFSymbolRenderingMode
    let size: CGFloat
    
    var body: some View {
        VStack {
            Image(systemName: symbol.name)
                .title()
                .symbolExplorerStyle(renderingMode)
                .frame(height: 36)
            
            Text(symbol.name)
                .caption()
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .selectableSymbolText()
            
            if symbol.isRestricted {
                Image(systemName: "exclamationmark.triangle")
                    .caption()
                    .foregroundStyle(.orange)
            }
        }
        .padding()
        .frame(width: size, height: size)
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 8))
        .symbolCopyContextMenu(symbol.name)
    }
}
