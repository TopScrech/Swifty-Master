import SwiftUI

struct TopicLink: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.link)
        }
    }
}

#Preview {
    TopicLink()
        .darkSchemePreferred()
}
