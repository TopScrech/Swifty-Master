import SwiftUI

struct TopicLazyHGrid: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.lazyHGrid)
        }
    }
}

#Preview {
    TopicLazyHGrid()
}
