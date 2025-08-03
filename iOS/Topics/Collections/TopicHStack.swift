import SwiftUI

struct TopicHStack: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.hStack)
        }
    }
}

#Preview {
    TopicHStack()
}
