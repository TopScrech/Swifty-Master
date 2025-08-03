import SwiftUI

struct TopicNavigationSplitView: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.navigationSplitView)
        }
    }
}

#Preview {
    TopicNavigationSplitView()
        .darkSchemePreferred()
}
