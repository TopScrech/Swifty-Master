import SwiftUI

struct TopicMenu: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Menu provides a customizable, collapsible list of options for user interaction")
            
            Menu {
                Button("Button") {}
            } label: {
                TopicActionButton("Menu", color: .blue.opacity(0.3))
            }
            
            CodeBlockView(.menu)
        }
    }
}

#Preview {
    TopicMenu()
}
