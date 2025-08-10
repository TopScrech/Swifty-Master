import SwiftUI

struct TopicPadding: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("The .padding() modifier adds space around a view, and can be customized by size, edges, or both to control layout spacing")
            
            CodeBlockView(.padding)
        }
    }
}

#Preview {
    TopicPadding()
}
