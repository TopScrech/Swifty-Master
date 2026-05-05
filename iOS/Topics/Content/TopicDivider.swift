import ScrechKit

struct TopicDivider: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Divider() in SwiftUI adds a visual line to separate content, helping structure your UI clearly. It’s especially useful in stacks and lists to improve readability and visual grouping")
            
            CodeBlockView(.divider)
        }
    }
}

#Preview {
    TopicDivider()
        .darkSchemePreferred()
}
