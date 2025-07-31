import SwiftUI

struct CodeBlockView: View {
    @EnvironmentObject private var store: ValueStore
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
                HStack(alignment: .top) {
                    if store.showCodeLineNumbers {
                        // Line numbers
                        VStack(alignment: .trailing, spacing: 4) {
                            ForEach(code.components(separatedBy: .newlines).indices, id: \.self) { index in
                                Text("\(index + 1)")
                                    .monospaced()
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.trailing, 10)
                    }
                    
                    Text(attributedCodeString(for: code))
                        .monospaced()
                        .foregroundColor(.white)
                }
                .padding(20)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
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
                .secondary()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
        }
    }
}

#Preview {
    CodeBlockView(.gauges)
        .darkSchemePreferred()
        .environmentObject(ValueStore())
}
