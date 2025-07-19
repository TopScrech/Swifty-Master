import SwiftUI

struct SimpleCodeBlockView: View {
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
    }
}

#Preview {
    SimpleCodeBlockView(.gauges)
        .darkSchemePreferred()
}
