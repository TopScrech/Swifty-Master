import SwiftUI

extension View {
    @ViewBuilder
    func glassProminentButtonStyle(_ color: Color) -> some View {
        if #available(iOS 26, macOS 26, tvOS 26, *) {
            self
#if !os(visionOS)
                .buttonStyle(.glassProminent)
                .tint(color)
#endif
        } else {
            self
        }
    }
}

extension View {
    @ViewBuilder
    func labelIconWidth(_ width: CGFloat) -> some View {
        if #available(iOS 26, macOS 26, visionOS 26, tvOS 26, *) {
            self
                .labelReservedIconWidth(width)
        } else {
            self
        }
    }
}
