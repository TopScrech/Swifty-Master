import SwiftUI

struct TopicEmptyView: View {
    var body: some View {
        VStack {
            SimpleCodeBlockView("""
EmptyView()
""")
        }
    }
}

#Preview {
    TopicEmptyView()
}
