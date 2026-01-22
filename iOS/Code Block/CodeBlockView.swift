import ScrechKit

struct CodeBlockView: View {
    @EnvironmentObject private var store: ValueStore
    
    private let code: String
    private let style: CodeBlockStyle
    
    @State private var availableWidth: CGFloat = 0
    
    init(_ code: CodeBlock, style: CodeBlockStyle = .standard) {
        self.code = code.code.removingLastLine
        self.style = style
    }
    
    init(_ code: String, style: CodeBlockStyle = .standard) {
        self.code = code.removingLastLine
        self.style = style
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView(.horizontal) {
                CodeBlockLinesView(
                    code: code,
                    style: style,
                    showsLineNumbers: store.showCodeLineNumbers
                )
                .padding(style.padding)
                .frame(minWidth: max(availableWidth, 1), alignment: .leading)
            }
            .scrollIndicators(.never)
#if !os(tvOS)
            CodeBlockViewCopyButton(code)
#endif
        }
        .background(style.background, in: .rect(cornerRadius: style.cornerRadius))
        .background(widthReader)
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
