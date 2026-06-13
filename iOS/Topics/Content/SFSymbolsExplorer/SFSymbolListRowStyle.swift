import ScrechKit

extension View {
    @ViewBuilder
    func symbolListRowStyle(spacing: CGFloat) -> some View {
#if os(tvOS)
        listRowInsets(EdgeInsets(top: spacing / 2, leading: spacing, bottom: spacing / 2, trailing: spacing))
#else
        listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: spacing / 2, leading: spacing, bottom: spacing / 2, trailing: spacing))
#endif
    }
}
