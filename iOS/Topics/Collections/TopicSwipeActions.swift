import ScrechKit

struct TopicSwipeActions: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Swipe actions reveal contextual actions when you swipe a list row")

            CodeBlockView(.swipeActions)
        }
    }
}

#Preview {
    TopicSwipeActions()
        .darkSchemePreferred()
}
