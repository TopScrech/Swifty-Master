import SwiftUI

struct TopicPassAView: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.passAView)
        }
    }
}

#Preview {
    TopicPassAView()
        .darkSchemePreferred()
}
