import SwiftUI

struct TopicGrid: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.grid)
        }
    }
}

#Preview {
    TopicGrid()
}
