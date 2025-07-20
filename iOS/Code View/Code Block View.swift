import ScrechKit

struct CodeBlockView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    private let code: String
    
    init(_ code: CodeBlock) {
        self.code = code.code
    }
    
    init(_ code: String) {
        self.code = code
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(attributedCodeString(for: code))
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
                ShareLink(item: code)
                
                SFButton("document.on.document") {
                    UIPasteboard.general.string = code
                }
            }
        }
    }
}

#Preview {
    CodeBlockView(.gauges)
        .darkSchemePreferred()
}
