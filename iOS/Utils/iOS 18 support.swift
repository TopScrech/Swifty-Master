import SwiftUI

extension View {
    @ViewBuilder
    func navSubtitle(_ subtitle: LocalizedStringKey) -> some View {
#if os(visionOS) || os(tvOS)
        self
#else
        if #available(iOS 26, *) {
            self
                .navigationSubtitle(subtitle)
        } else {
            self
        }
#endif
    }
    
    func navSubtitle<T: CustomStringConvertible>(_ subtitle: T) -> some View {
        navSubtitle(LocalizedStringKey(subtitle.description))
    }
}

extension View {
    @ViewBuilder
    func glassyBackground(_ rectRounding: CGFloat? = nil) -> some View {
#if os(visionOS)
        if let rectRounding {
            self
                .background(.ultraThinMaterial, in: .rect(cornerRadius: rectRounding))
        } else {
            self
                .background(.ultraThinMaterial)
        }
#else
        if #available(iOS 26, macOS 26, tvOS 26, *) {
            if let rectRounding {
                self
                    .glassEffect(in: .rect(cornerRadius: rectRounding))
            } else {
                self
                    .glassEffect()
            }
        } else {
            if let rectRounding {
                self
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: rectRounding))
            } else {
                self
                    .background(.ultraThinMaterial)
            }
        }
#endif
    }
}

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
