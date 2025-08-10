import SwiftUI

struct TopicFrame: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("The .frame() modifier sets a view’s size, with options for fixed or flexible minimum, ideal, and maximum dimensions along with alignment")
            
            CodeBlockView(.frame)
        }
    }
}

#Preview {
    TopicFrame()
}
