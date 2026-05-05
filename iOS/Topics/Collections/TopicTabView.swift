import SwiftUI

struct TopicTabView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TabView lets you switch between multiple views using a tab bar interface")
            
            CodeBlockView(.tabView)
            
            Text("Starting with iOS 18, you can use the new, cleaner Tab API")
            
            CodeBlockView(.tabViewNew)
        }
    }
}

#Preview {
    TopicTabView()
        .darkSchemePreferred()
}
