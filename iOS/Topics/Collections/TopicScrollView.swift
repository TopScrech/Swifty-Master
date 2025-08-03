import SwiftUI

struct TopicScrollView: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.scrollView)
        }
    }
}

#Preview {
    TopicScrollView()
}
