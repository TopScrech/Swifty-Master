import SwiftUI

struct TopicNavigationSplitView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Displays a multi-column interface for navigating between primary and detail content, often used on iPad and Mac")
            
            CodeBlockView(.navigationSplitView)
        }
    }
}

#Preview {
    TopicNavigationSplitView()
        .darkSchemePreferred()
}
