import SwiftUI

struct CodeBlockLinesView: View {
    let code: String
    let style: CodeBlockStyle
    let showsLineNumbers: Bool
    
    @State private var lineNumberWidth: CGFloat = 0
    
    private var codeLines: [String] {
        code.components(separatedBy: .newlines)
    }
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: style.lineSpacing) {
            ForEach(Array(codeLines.enumerated()), id: \.offset) { index, line in
                HStack(alignment: .top, spacing: style.lineNumberSpacing) {
                    if showsLineNumbers {
                        Text(String(index + 1))
                            .font(style.font)
                            .foregroundColor(style.lineNumberColor)
                            .frame(width: max(lineNumberWidth, style.lineNumberMinWidth), alignment: .trailing)
                            .lineLimit(1)
                    }
                    
                    Text(attributedCodeString(for: line))
                        .font(style.font)
                        .foregroundColor(style.textColor)
                }
            }
        }
#if !os(tvOS)
        .textSelection(.enabled)
#endif
        .background(LineNumberWidthReader(text: String(codeLines.count), font: style.font))
        .onPreferenceChange(LineNumberWidthKey.self) { width in
            lineNumberWidth = width
        }
    }
}

private struct LineNumberWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

private struct LineNumberWidthReader: View {
    let text: String
    let font: Font
    
    var body: some View {
        Text(text)
            .font(font)
            .background(GeometryReader { proxy in
                Color.clear.preference(key: LineNumberWidthKey.self, value: proxy.size.width)
            })
            .hidden()
    }
}
