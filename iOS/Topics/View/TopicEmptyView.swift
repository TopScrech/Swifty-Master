import SwiftUI

struct TopicEmptyView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("EmptyView is a built-in SwiftUI type that renders nothing in the view hierarchy. It’s useful for placeholder logic or conditional rendering when no UI should be shown")
            
            CodeBlockView(.emptyView)
            
            TopicHeading("Usage with AnyView")
            
            Text("When using a function that returns AnyView via a switch statement, EmptyView() is a convenient and concise default case. It avoids unnecessary layout calculations while still satisfying the return type")
            
            CodeBlockView(.emptyViewAnyView)
        }
    }
}

#Preview {
    TopicEmptyView()
}
