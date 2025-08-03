import SwiftUI

struct TopicNavigationBar: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.navigationBar)
        }
    }
}

#Preview {
    TopicNavigationBar()
        .darkSchemePreferred()
}
