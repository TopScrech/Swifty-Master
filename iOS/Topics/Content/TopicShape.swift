import SwiftUI

struct TopicShape: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Shapes let you easily create custom graphics like circles & rectangles directly in code. They can be styled, scaled, and animated to build unique and dynamic UI elements")
            
            CodeBlockView(.shape)
        }
    }
}

#Preview {
    TopicShape()
}
