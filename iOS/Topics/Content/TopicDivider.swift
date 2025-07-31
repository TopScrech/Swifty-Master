import SwiftUI

struct TopicDivider: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicDivider")
            
            CodeBlockView(.divider)
        }
    }
}

#Preview {
    TopicDivider()
}
