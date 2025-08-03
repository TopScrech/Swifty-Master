import SwiftUI

struct TopicCustomKeyboard: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicCustomKeyboard")
            
            CodeBlockView(.customKeyboard)
        }
    }
}

#Preview {
    TopicCustomKeyboard()
}
