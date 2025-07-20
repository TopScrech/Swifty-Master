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
