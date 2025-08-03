import SwiftUI

struct TopicNavigationStack: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.navigationStack)
        }
    }
}

#Preview {
    TopicNavigationStack()
        .darkSchemePreferred()
}
