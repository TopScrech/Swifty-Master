import SwiftUI

struct TopicZStack: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Overlays views on top of each other along the z-axis")
            
            CodeBlockView(.zStack)
        }
    }
}

#Preview {
    TopicZStack()
}
