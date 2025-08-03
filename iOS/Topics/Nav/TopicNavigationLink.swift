import SwiftUI

struct TopicNavigationLink: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.navigationLink)
        }
    }
}

#Preview {
    TopicNavigationLink()
        .darkSchemePreferred()
}
