import ScrechKit

struct CodeBlockView: View {
    @EnvironmentObject private var store: ValueStore
    
    private let code: String
    
    init(_ code: CodeBlock) {
        self.code = code.code.removingLastLine
    }
    
    init(_ code: String) {
        self.code = code.removingLastLine
    }
    
    private var codeLines: Array<(offset: Int, element: String)> {
        Array(code.components(separatedBy: .newlines).enumerated())
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            ZStack {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(codeLines, id: \.offset) { index, line in
                        HStack(alignment: .top, spacing: 16) {
                            if store.showCodeLineNumbers {
                                Text(index + 1)
                                    .monospaced()
                                    .foregroundColor(.gray)
                                    .frame(width: 30, alignment: .trailing)
                                    .lineLimit(1)
                            }
                            
                            Text(attributedCodeString(for: line))
                                .monospaced()
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
#if os(visionOS)
                .background(.regularMaterial)
#else
                .frame(minWidth: UIScreen.main.bounds.width * 0.92, alignment: .leading)
                .background(.ultraThinMaterial)
#endif
                .cornerRadius(20)
#if !os(tvOS)
                CodeBlockViewCopyButton(code)
#endif
            }
        }
        .scrollIndicators(.never)
    }
}

#Preview {
    CodeBlockView(.gauges)
        .environmentObject(ValueStore())
        .environment(NavModel())
}
