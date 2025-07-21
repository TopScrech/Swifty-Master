import SwiftUI

struct TopicButton: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Button is a UI element that allows users to trigger an action when tapped")
            
            SimpleCodeBlockView(.button)
            
            TopicHeading("Custom Label")
            
            SimpleCodeBlockView(.buttonCustom)
        }
    }
}

#Preview {
    TopicButton()
}
