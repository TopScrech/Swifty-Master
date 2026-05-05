import ScrechKit

struct TopicNavigationStack: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("A modern container for managing a stack of views with programmatic navigation")
            
            CodeBlockView(.navigationStack)
        }
    }
}

#Preview {
    TopicNavigationStack()
        .darkSchemePreferred()
}
