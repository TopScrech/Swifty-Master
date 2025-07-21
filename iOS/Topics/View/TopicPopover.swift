import SwiftUI

struct TopicPopover: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicPopover")
            
            SimpleCodeBlockView(.popover)
        }
    }
}

#Preview {
    TopicPopover()
}
