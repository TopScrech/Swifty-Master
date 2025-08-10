import ScrechKit

struct CodeBlockView: View {
    @EnvironmentObject private var store: ValueStore
    @Environment(\.colorScheme) private var colorScheme
    
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
#if !os(visionOS)
                .frame(minWidth: UIScreen.main.bounds.width * 0.92, alignment: .leading)
#endif
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                Button {
                    Pasteboard.copy(code)
                } label: {
                    Image(systemName: "document.on.document")
                        .title3(.semibold)
                        .padding(10)
                        .glassyBackground(16)
                    //                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
                        .padding(8)
                        .contextMenu {
                            ShareLink(item: code)
                        }
                }
                .secondary()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
        }
        .scrollIndicators(.never)
    }
}

extension String {
    var removingLastLine: String {
        var lines = self.components(separatedBy: .newlines)
        
        if lines.isEmpty == false {
            lines.removeLast()
        }
        
        return lines.joined(separator: "\n")
    }
}

#Preview {
    CodeBlockView(.gauges)
        .darkSchemePreferred()
        .environmentObject(ValueStore())
}
