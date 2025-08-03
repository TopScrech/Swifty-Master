import SwiftUI

struct TopicShape: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicShape")
            
            CodeBlockView(.shape)
        }
    }
}

#Preview {
    TopicShape()
}
