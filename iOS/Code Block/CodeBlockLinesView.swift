import SwiftUI

struct CodeBlockLinesView: View {
    @EnvironmentObject private var store: ValueStore
    
    private let code: String
    private let style: CodeBlockStyle
    
    init(_ code: String, with style: CodeBlockStyle) {
        self.code = code
        self.style = style
    }
    
    @State private var lineNumberWidth = 0.0
    
    private var codeLines: [String] {
        code.components(separatedBy: .newlines)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: style.lineSpacing) {
            ForEach(Array(codeLines.enumerated()), id: \.offset) { index, line in
                HStack(alignment: .top, spacing: style.lineNumberSpacing) {
                    if store.showCodeLineNumbers {
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
