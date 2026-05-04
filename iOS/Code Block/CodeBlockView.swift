import ScrechKit

struct CodeBlockView: View {
    private let code: String
    private let style: CodeBlockStyle
    
    init(_ code: CodeBlock, style: CodeBlockStyle = .standard) {
        self.code = code.code.removingLastLine
        self.style = style
    }
    
    init(_ code: String, style: CodeBlockStyle = .standard) {
        self.code = code.removingLastLine
        self.style = style
    }
    
    @State private var availableWidth = 0.0
    
    var body: some View {
        ScrollView(.horizontal) {
            CodeBlockLinesView(code, with: style)
                .padding(style.padding)
                .frame(minWidth: max(availableWidth, 1), alignment: .leading)
        }
        .scrollIndicators(.never)
        .fixedSize(horizontal: false, vertical: true)
#if !os(tvOS)
        .overlay(alignment: copyButtonAlignment) {
            CodeBlockViewCopyButton(code)
        }
#endif
        .background(style.background, in: .rect(cornerRadius: style.cornerRadius))
        .background(widthReader)
    }
    
    private var copyButtonAlignment: Alignment {
        code.split(separator: "\n", omittingEmptySubsequences: false).count > 3 ? .topTrailing : .trailing
    }
    
    private var widthReader: some View {
        GeometryReader { proxy in
            Color.clear
                .onAppear {
                    availableWidth = proxy.size.width
                }
                .onChange(of: proxy.size.width) { _, newValue in
                    availableWidth = newValue
                }
        }
    }
}

#Preview {
    CodeBlockView(.gauges)
        .darkSchemePreferred()
        .environmentObject(ValueStore())
        .environment(NavModel())
}
