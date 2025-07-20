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
            Text(attributedCodeString(for: code))
                .monospaced()
                .padding(5)
                .background(.ultraThinMaterial)
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        .overlay(alignment: .bottomLeading) {
            Button {
                UIPasteboard.general.string = code
            } label: {
                Image(systemName: "document.on.document")
                    .title3(.semibold)
                    .padding(10)
                    .glassEffect(in: .rect(cornerRadius: 20))
//                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
                    .padding(8)
            }
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    SimpleCodeBlockView(.gauges)
        .darkSchemePreferred()
}
