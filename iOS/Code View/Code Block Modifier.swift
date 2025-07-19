import ScrechKit

struct CodeBlockModifier: ViewModifier {
    private let code: CodeBlock
    
    init(_ code: CodeBlock) {
        self.code = code
    }
    
    @State private var sheetCode = false
    
    func body(content: Content) -> some View {
        content
            .sheet($sheetCode) {
                NavigationView {
                    CodeBlockView(code)
                }
            }
            .toolbar {
                SFButton("curlybraces") {
                    sheetCode = true
                }
            }
    }
}

extension View {
    func codeBlock(_ code: CodeBlock) -> some View {
        modifier(CodeBlockModifier(code))
    }
}
