import SwiftUI

struct CodeBlockLines: View {
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
        HStack(alignment: .top, spacing: style.lineNumberSpacing) {
            if store.showCodeLineNumbers {
                CodeBlockLineNumbers(
                    lineCount: codeLines.count,
                    width: max(lineNumberWidth, style.lineNumberMinWidth),
                    style: style
                )
            }
            
            codeText
        }
#if !os(tvOS)
        .textSelection(.enabled)
#endif
        .background(LineNumberWidthReader(text: String(codeLines.count), font: style.font))
        .onPreferenceChange(LineNumberWidthKey.self) { width in
            lineNumberWidth = width
        }
    }
    
    @ViewBuilder private var codeText: some View {
#if canImport(UIKit) && !os(tvOS)
        SelectableCodeTextView(code: code, textColor: style.textColor, lineSpacing: style.lineSpacing)
#else
        VStack(alignment: .leading, spacing: style.lineSpacing) {
            ForEach(codeLines.enumerated(), id: \.offset) { _, line in
                Text(attributedCodeString(for: line))
                    .font(style.font)
                    .foregroundStyle(style.textColor)
            }
        }
#endif
    }
}

private struct CodeBlockLineNumbers: View {
    let lineCount: Int
    let width: CGFloat
    let style: CodeBlockStyle
    
    var body: some View {
#if canImport(UIKit) && !os(tvOS)
        CodeBlockLineNumbersTextView(
            lineCount: lineCount,
            width: width,
            color: style.lineNumberColor,
            lineSpacing: style.lineSpacing
        )
#else
        VStack(alignment: .trailing, spacing: style.lineSpacing) {
            ForEach(1...lineCount, id: \.self) {
                Text(String($0))
                    .font(style.font)
                    .foregroundStyle(style.lineNumberColor)
                    .frame(width: width, alignment: .trailing)
                    .lineLimit(1)
            }
        }
#endif
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
