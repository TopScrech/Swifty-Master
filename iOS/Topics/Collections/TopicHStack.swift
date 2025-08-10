import SwiftUI

struct TopicHStack: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Arranges views vertically in a single column")
            
            CodeBlockView(.hStack)
        }
    }
}

#Preview {
    TopicHStack()
}
