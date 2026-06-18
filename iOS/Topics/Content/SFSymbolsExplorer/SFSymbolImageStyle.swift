import ScrechKit

extension View {
    @ViewBuilder
    func symbolExplorerStyle(_ renderingMode: SFSymbolRenderingMode) -> some View {
        if renderingMode == .palette {
            symbolRenderingMode(renderingMode.symbolRenderingMode)
                .foregroundStyle(.blue, .green, .orange)
        } else {
            symbolRenderingMode(renderingMode.symbolRenderingMode)
        }
    }
}
