import ScrechKit

struct TopicSwipeActionsInContainers: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Swipe actions now work beyond `List` rows, so custom rows in scroll views, stacks, grids and custom layouts can expose the same leading or trailing actions")
            
            Text("Add `swipeActions` to each row, then add `swipeActionsContainer` to the scrollable parent so SwiftUI coordinates presentation, dismissal and one-open-row behavior")
            
            CodeBlockView(.swipeActionsInContainers)
        }
    }
}

#Preview {
    TopicSwipeActionsInContainers()
        .darkSchemePreferred()
}
