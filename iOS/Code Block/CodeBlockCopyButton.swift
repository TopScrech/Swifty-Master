import ScrechKit

struct CodeBlockCopyButton: View {
    private let code: String
    
    init(_ code: String) {
        self.code = code
    }
    
    @State private var trigger = false
    
    var body: some View {
        Button {
            Pasteboard.copy(code)
            trigger.toggle()
        } label: {
            Image(systemName: "document.on.document")
                .title3(.semibold)
                .padding(10)
                .glassyBackground(16)
                .padding(8)
                .contentShape(.rect)
                .contextMenu {
                    ShareLink(item: code)
                }
        }
        .buttonStyle(.plain)
        .secondary()
#if !os(visionOS)
        .hapticOn(trigger, as: .success)
#endif
    }
}

//#Preview {
//    CodeBlockCopyButton()
//    .darkSchemePreferred()
//}
