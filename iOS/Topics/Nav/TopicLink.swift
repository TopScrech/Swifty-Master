import SwiftUI

struct TopicLink: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Link")
            
#warning("This code block doesn't work")
            CodeBlockView(.link)
        }
    }
}

#Preview {
    TopicLink()
        .darkSchemePreferred()
}
