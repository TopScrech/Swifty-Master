import SwiftUI

// MARK: - Nav Subtitle
struct NavSubtitle: ViewModifier {
    private let subtitle: LocalizedStringKey
    
    init(_ subtitle: LocalizedStringKey) {
        self.subtitle = subtitle
    }
    
    init(_ subtitle: String) {
        self.subtitle = LocalizedStringKey(subtitle)
    }
    
    func body(content: Content) -> some View {
#if os(visionOS)
        content
#else
        if #available(iOS 26, *) {
            content
#if DEBUG
                .navigationSubtitle(subtitle)
#endif
        }
#endif
    }
}

extension View {
    func navSubtitle(_ subtitle: LocalizedStringKey) -> some View {
        modifier(NavSubtitle(subtitle))
    }
    
    func navSubtitle<T: CustomStringConvertible>(_ subtitle: T) -> some View {
        modifier(NavSubtitle(subtitle.description))
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
        if #available(iOS 26, macOS 26, *) {
            if let rectRounding {
                content
#if DEBUG
                    .glassEffect(in: .rect(cornerRadius: rectRounding))
#endif
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
        if #available(iOS 26, macOS 26, *) {
            content
#if DEBUG && !os(visionOS)
                .buttonStyle(.glassProminent)
#endif
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
        if #available(iOS 26, macOS 26, *) {
            content
#if DEBUG
                .labelReservedIconWidth(width)
#endif
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
