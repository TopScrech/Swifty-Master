import ScrechKit

struct TopicButton: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button is a UI element that allows users to trigger an action when tapped")
            
            CodeBlockView(.button)
            
            TopicHeading("Custom Label")
            
            CodeBlockView(.buttonCustom)
        }
    }
}

#Preview {
    TopicButton()
        .darkSchemePreferred()
}
