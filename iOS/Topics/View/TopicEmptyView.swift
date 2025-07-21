import SwiftUI

struct TopicEmptyView: View {
    var body: some View {
        VStack {
            SimpleCodeBlockView(.emptyView)
        }
    }
}

#Preview {
    TopicEmptyView()
}
