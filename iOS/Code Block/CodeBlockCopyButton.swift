import ScrechKit

struct CodeBlockCopyButton: View {
    private let code: String
    
    init(_ code: String) {
        self.code = code
    }
    
    var body: some View {
        Button {
            Pasteboard.copy(code)
        } label: {
            Image(systemName: "document.on.document")
                .title3(.semibold)
                .padding(10)
                .glassyBackground(16)
                .padding(8)
                .contextMenu {
                    ShareLink(item: code)
                }
        }
        .buttonStyle(.plain)
        .secondary()
    }
}

//#Preview {
//    CodeBlockCopyButton()
//    .darkSchemePreferred()
//}
