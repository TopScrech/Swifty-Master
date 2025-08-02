import SwiftUI

struct TopicDivider: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Divider() in SwiftUI adds a visual line to separate content, helping structure your UI clearly. It’s especially useful in stacks and lists to improve readability and visual grouping")
            
            Divider()
            
            CodeBlockView(.divider)
        }
    }
}

#Preview {
    TopicDivider()
}
