import SwiftUI

struct TopicGeometryReader: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("GeometryReader provides the size and position of its container, allowing you to create layouts that adapt to available space")
            
            CodeBlockView(.geometryReader)
        }
    }
}

#Preview {
    TopicGeometryReader()
}
