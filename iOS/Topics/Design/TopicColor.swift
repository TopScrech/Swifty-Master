import ScrechKit

struct TopicColor: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI Color is a type that represents a color in a way that is easy to use and integrate into SwiftUI views")
            
            CodeBlockView(.color)
            
            TopicHeading("Hex colors")
            
            Text("SwiftUI does not include a built-in hex initializer, but you can add one when your design specs use values like 0xFFFFFF")
            
            CodeBlockView(.hexColors)
        }
    }
}

#Preview {
    TopicColor()
        .darkSchemePreferred()
}
