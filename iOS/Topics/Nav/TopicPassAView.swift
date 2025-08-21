import SwiftUI

struct TopicPassAView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI lets you pass a view into another view by storing it as a property, often using AnyView to handle different view types. This makes it easy to reuse layouts while swapping the displayed content")
            
            CodeBlockView(.passAView)
        }
    }
}

#Preview {
    TopicPassAView()
}
