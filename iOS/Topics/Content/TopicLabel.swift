import SwiftUI

struct TopicLabel: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("The Label view combines text with an icon, which can come from SF Symbols, your asset catalog, or a fully custom view, and can be styled with different label styles")
            
            CodeBlockView(.label)
        }
    }
}

#Preview {
    TopicLabel()
}
