import ScrechKit

struct CodeBlockView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    private let code: CodeBlock
    
    init(_ code: CodeBlock) {
        self.code = code
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(attributedCodeString(for: code.code))
                .monospaced()
                .padding()
                .background {
                    if colorScheme == .light {
                        Color.black
                    }
                }
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                SFButton("xmark") {
                    dismiss()
                }
                .tint(.red)
            }
            
            ToolbarSpacer(placement: .bottomBar)
            
            ToolbarItemGroup(placement: .bottomBar) {
                ShareLink(item: code.code)
                
                SFButton("document.on.document") {
                    UIPasteboard.general.string = code.code
                }
            }
        }
    }
}

#Preview {
    CodeBlockView(.gauges)
        .darkSchemePreferred()
}
