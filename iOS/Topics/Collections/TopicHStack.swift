import ScrechKit

struct TopicHStack: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Arranges views horizontally in a single column")
            
            CodeBlockView(.hStack)
        }
    }
}

#Preview {
    TopicHStack()
        .darkSchemePreferred()
}
