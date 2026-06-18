import ScrechKit

struct SFSymbolsGrid: View {
    let symbols: [SFSymbolEntry]
    let renderingMode: SFSymbolRenderingMode
    
    @State private var availableWidth = 0.0
    
    private let spacing = 12.0
    private let minimumTileSize = 112.0
    
    private var contentWidth: CGFloat {
        max(0, availableWidth - spacing * 2)
    }
    
    private var columnCount: Int {
        guard contentWidth > 0 else {
            return 3
        }
        
        return max(1, Int((contentWidth + spacing) / (minimumTileSize + spacing)))
    }
    
    private var tileSize: CGFloat {
        guard contentWidth > 0 else {
            return minimumTileSize
        }
        
        let totalSpacing = spacing * CGFloat(columnCount - 1)
        return floor((contentWidth - totalSpacing) / CGFloat(columnCount))
    }
    
    private var rowStarts: [Int] {
        Array(stride(from: 0, to: symbols.count, by: columnCount))
    }
    
    var body: some View {
        List(rowStarts, id: \.self) { start in
            HStack(spacing: spacing) {
                ForEach(rowSymbols(start)) { symbol in
                    SFSymbolTile(symbol: symbol, renderingMode: renderingMode, size: tileSize)
                }
                
                ForEach(0..<placeholderCount(start), id: \.self) { _ in
                    Color.clear
                        .frame(width: tileSize, height: tileSize)
                }
            }
            .symbolListRowStyle(spacing: spacing)
        }
        .listStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onGeometryChange(for: CGFloat.self) {
            $0.size.width
        } action: {
            availableWidth = $0
        }
    }
    
    private func rowSymbols(_ start: Int) -> ArraySlice<SFSymbolEntry> {
        symbols[start..<min(start + columnCount, symbols.count)]
    }
    
    private func placeholderCount(_ start: Int) -> Int {
        columnCount - rowSymbols(start).count
    }
}
