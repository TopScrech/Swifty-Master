import ScrechKit

extension View {
    @ViewBuilder
    func selectableSymbolText() -> some View {
#if os(tvOS)
        self
#else
        textSelection(.enabled)
#endif
    }
}
