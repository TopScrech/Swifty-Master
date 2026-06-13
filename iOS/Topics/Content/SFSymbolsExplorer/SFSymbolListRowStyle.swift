import ScrechKit

extension View {
    @ViewBuilder
    func symbolListRowStyle() -> some View {
#if os(tvOS)
        self
#else
        listRowSeparator(.hidden)
#endif
    }
}
