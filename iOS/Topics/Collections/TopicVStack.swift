import SwiftUI

struct TopicVStack: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.vStack)
        }
    }
}

#Preview {
    TopicVStack()
}
