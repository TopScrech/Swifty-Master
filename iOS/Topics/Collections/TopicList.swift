import SwiftUI

struct TopicList: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.list)
        }
    }
}

#Preview {
    TopicList()
}
