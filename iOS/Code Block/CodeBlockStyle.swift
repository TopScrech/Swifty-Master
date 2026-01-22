import SwiftUI

struct CodeBlockStyle {
    var font: Font
    var lineSpacing: CGFloat
    var lineNumberSpacing: CGFloat
    var lineNumberColor: Color
    var textColor: Color
    var padding: EdgeInsets
    var cornerRadius: CGFloat
    var background: AnyShapeStyle
    var lineNumberMinWidth: CGFloat
    
    static var standard: CodeBlockStyle {
#if os(macOS) || os(visionOS)
        let background = AnyShapeStyle(.regularMaterial)
#else
        let background = AnyShapeStyle(.ultraThinMaterial)
#endif
        
        return CodeBlockStyle(
            font: .system(.footnote, design: .monospaced),
            lineSpacing: 4,
            lineNumberSpacing: 16,
            lineNumberColor: .secondary,
            textColor: .primary,
            padding: EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16),
            cornerRadius: 20,
            background: background,
            lineNumberMinWidth: 0
        )
    }
}
