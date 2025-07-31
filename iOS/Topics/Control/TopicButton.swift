import SwiftUI

struct TopicButton: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Button is a UI element that allows users to trigger an action when tapped")
            
            CodeBlockView(.button)
            
            TopicHeading("Custom Label")
            
            CodeBlockView(.buttonCustom)
        }
    }
}

#Preview {
    TopicButton()
}
