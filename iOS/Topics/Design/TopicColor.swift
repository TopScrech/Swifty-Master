import SwiftUI

struct TopicColor: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI Color is a type that represents a color in a way that is easy to use and integrate into SwiftUI views")
            
            CodeBlockView(.color)
        }
    }
}

#Preview {
    TopicColor()
}
