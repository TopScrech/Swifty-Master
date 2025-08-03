import SwiftUI

struct TopicLazyVGrid: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.lazyVGrid)
        }
    }
}

#Preview {
    TopicLazyVGrid()
}
