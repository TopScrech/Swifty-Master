import SwiftUI

struct TopicNavigationBar: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("The top bar in a navigation container that can show titles, buttons, and other controls")
            
            CodeBlockView(.navigationBar)
        }
    }
}

#Preview {
    TopicNavigationBar()
}
