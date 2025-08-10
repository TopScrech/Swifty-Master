import SwiftUI

struct TopicTabView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TabView lets you switch between multiple views using a tab bar interface")
            
            CodeBlockView(.tabView)
        }
    }
}

#Preview {
    TopicTabView()
}
