import SwiftUI

struct TopicSFSymbols: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicSFSymbols")
            
            CodeBlockView(.sfSymbols)
        }
    }
}

#Preview {
    TopicSFSymbols()
}
