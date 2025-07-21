import SwiftUI

struct TopicContextMenu: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Context Menu allows displaying a menu of actions when a user holds a specific element where .contextMenu was applied")
            
            SimpleCodeBlockView(.contextMenu)
        }
    }
}

#Preview {
    TopicContextMenu()
}
