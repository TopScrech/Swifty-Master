import SwiftUI

struct TopicNavigationStack: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("A modern container for managing a stack of views with programmatic navigation")
            
            CodeBlockView(.navigationStack)
        }
    }
}

#Preview {
    TopicNavigationStack()
}
