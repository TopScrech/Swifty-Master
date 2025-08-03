import SwiftUI

struct TopicEqualSizeViews: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.equalSizeViews)
        }
    }
}

#Preview {
    TopicEqualSizeViews()
}
