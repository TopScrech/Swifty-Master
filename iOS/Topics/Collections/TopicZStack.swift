import ScrechKit

struct TopicZStack: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Overlays views on top of each other along the z-axis")
            
            CodeBlockView(.zStack)
        }
    }
}

#Preview {
    TopicZStack()
        .darkSchemePreferred()
}
