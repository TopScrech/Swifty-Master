import SwiftUI

struct TopicGrid: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Grid arranges views in rows and columns, giving you flexible control over layout without lazy loading")
            
            CodeBlockView(.grid)
        }
    }
}

#Preview {
    TopicGrid()
}
