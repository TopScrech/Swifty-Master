import ScrechKit

struct SFSymbolsGrid: View {
    let symbols: [SFSymbolEntry]
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    private var columnCount: Int {
        horizontalSizeClass == .compact ? 3 : 5
    }
    
    private var rowStarts: [Int] {
        Array(stride(from: 0, to: symbols.count, by: columnCount))
    }
    
    var body: some View {
        List(rowStarts, id: \.self) { start in
            HStack {
                ForEach(rowSymbols(start)) { symbol in
                    SFSymbolTile(symbol: symbol)
                }
                
                ForEach(0..<placeholderCount(start), id: \.self) { _ in
                    Color.clear
                        .frame(maxWidth: .infinity, minHeight: 96)
                }
            }
            .symbolListRowStyle()
        }
        .listStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func rowSymbols(_ start: Int) -> ArraySlice<SFSymbolEntry> {
        symbols[start..<min(start + columnCount, symbols.count)]
    }
    
    private func placeholderCount(_ start: Int) -> Int {
        columnCount - rowSymbols(start).count
    }
}
