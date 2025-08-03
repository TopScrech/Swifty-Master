import SwiftUI

struct TopicTabView: View {
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.tabView)
        }
    }
}

#Preview {
    TopicTabView()
}
