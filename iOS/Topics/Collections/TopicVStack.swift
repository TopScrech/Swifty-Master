import SwiftUI

struct TopicVStack: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Arranges views horizontally in a single row")
            
            CodeBlockView(.vStack)
        }
    }
}

#Preview {
    TopicVStack()
}
