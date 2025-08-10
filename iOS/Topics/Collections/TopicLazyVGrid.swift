import SwiftUI

struct TopicLazyVGrid: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Arranges views in a vertical grid, loading items only as they appear on screen for better performance")
            
            CodeBlockView(.lazyVGrid)
        }
    }
}

#Preview {
    TopicLazyVGrid()
}
