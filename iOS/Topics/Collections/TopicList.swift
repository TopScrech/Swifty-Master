import SwiftUI

struct TopicList: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("List displays a scrollable lazy collection of rows that can contain static or dynamic content")
            
            CodeBlockView(.list)
        }
    }
}

#Preview {
    TopicList()
}
