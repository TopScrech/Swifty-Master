import SwiftUI

struct TopicDetectCompactOrRegular: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.detectCompactOrRegular)
        }
    }
}

#Preview {
    TopicDetectCompactOrRegular()
}
