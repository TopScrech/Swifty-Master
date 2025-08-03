import SwiftUI

struct TopicPadding: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.padding)
        }
    }
}

#Preview {
    TopicPadding()
}
