import ScrechKit

struct TopicContextMenu: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Context Menu allows displaying a menu of actions when a user holds a specific element where .contextMenu was applied")
            
            CodeBlockView(.contextMenu)
        }
    }
}

#Preview {
    TopicContextMenu()
        .darkSchemePreferred()
}
