import ScrechKit

struct TopicVStack: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Arranges views vertically in a single row")
            
            CodeBlockView(.vStack)
        }
    }
}

#Preview {
    TopicVStack()
        .darkSchemePreferred()
}
