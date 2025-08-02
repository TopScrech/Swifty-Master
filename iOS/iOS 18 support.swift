import SwiftUI

// MARK: - Nav Subtitle
struct NavSubtitle: ViewModifier {
    private let subtitle: LocalizedStringKey
    
    init(_ subtitle: LocalizedStringKey) {
        self.subtitle = subtitle
    }
    
    func body(content: Content) -> some View {
#if os(visionOS)
        content
#else
        if #available(iOS 26, *) {
            content
                .navigationSubtitle(subtitle)
        }
#endif
    }
}

extension View {
    func navSubtitle(_ subtitle: LocalizedStringKey) -> some View {
        modifier(NavSubtitle(subtitle))
    }
}

// MARK: - Glassy Background
struct GlassyBackground: ViewModifier {
    private let rectRounding: CGFloat?
    
    init(_ rectRounding: CGFloat? = nil) {
        self.rectRounding = rectRounding
    }
    
    func body(content: Content) -> some View {
#if os(visionOS)
        if let rectRounding {
            content
                .background(.ultraThinMaterial, in: .rect(cornerRadius: rectRounding))
        } else {
            content
                .background(.ultraThinMaterial)
        }
#else
        if #available(iOS 26, *) {
            if let rectRounding {
                content
                    .glassEffect(in: .rect(cornerRadius: rectRounding))
            } else {
                content
            }
        } else {
            if let rectRounding {
                content
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: rectRounding))
            } else {
                content
                    .background(.ultraThinMaterial)
            }
        }
#endif
    }
}

extension View {
    func glassyBackground(_ rectRounding: CGFloat? = nil) -> some View {
        modifier(GlassyBackground(rectRounding))
    }
}

// MARK: - Glass Prominent Button Style
struct GlassProminentButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 26, *) {
            content
                .buttonStyle(.glassProminent)
        } else {
            content
        }
    }
}

extension View {
    func glassProminentButtonStyle() -> some View {
        modifier(GlassProminentButtonStyle())
    }
}

// MARK: - Label Icon Width
struct LabelIconWidth: ViewModifier {
    private let width: CGFloat
    
    init(_ width: CGFloat) {
        self.width = width
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 26, *) {
            content
                .labelReservedIconWidth(width)
        } else {
            content
        }
    }
}

extension View {
    func labelIconWidth(_ width: CGFloat) -> some View {
        modifier(LabelIconWidth(width))
    }
}
