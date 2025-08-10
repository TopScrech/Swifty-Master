import SwiftUI

struct TopicDifferentiateOS: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Conditional compilation checks let you run different code depending on the platform or environment your app is built for")
            
            CodeBlockView(.differentiateOS)
        }
    }
}

#Preview {
    TopicDifferentiateOS()
}
