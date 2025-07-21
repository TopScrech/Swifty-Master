import SwiftUI

struct TopicMenu: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Menu provides a customizable, collapsible list of options for user interaction")
            
            SimpleCodeBlockView(.menu)
        }
    }
}

#Preview {
    TopicMenu()
}
