import SwiftUI

struct TopicZStack: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.zStack)
        }
    }
}

#Preview {
    TopicZStack()
}
