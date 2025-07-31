import SwiftUI

struct TopicGradient: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI Gradient allows you to create visually appealing, smooth transitions between colors across a shape or area in your user interface")
            
            CodeBlockView(.gradient)
        }
    }
}

#Preview {
    TopicGradient()
}
