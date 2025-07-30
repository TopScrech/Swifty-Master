import SwiftUI

struct SimpleCodeBlockView: View {
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
            ZStack {
                Text(attributedCodeString(for: code))
                    .monospaced()
                    .padding(20)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                
                Button {
                    UIPasteboard.general.string = code
                } label: {
                    Image(systemName: "document.on.document")
                        .title3(.semibold)
                        .padding(10)
                        .glassEffect(in: .rect(cornerRadius: 16))
                    //                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
                        .padding(8)
                }
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
        }
    }
}

#Preview {
    SimpleCodeBlockView(.gauges)
        .darkSchemePreferred()
}
