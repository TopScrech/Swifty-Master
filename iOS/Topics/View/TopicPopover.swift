import SwiftUI

struct TopicPopover: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("A popover displays a small, dismissible view anchored to another view, commonly used for contextual information or actions")
            
            CodeBlockView(.popover)
        }
    }
}

#Preview {
    TopicPopover()
}
