import SwiftUI

struct TopicNavigationView: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.navigationView)
        }
    }
}

#Preview {
    TopicNavigationView()
        .darkSchemePreferred()
}
