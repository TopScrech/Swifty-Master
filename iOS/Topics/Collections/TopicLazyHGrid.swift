import SwiftUI

struct TopicLazyHGrid: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Arranges views in a horizontal grid, also loading items lazily to optimize performance")
            
            CodeBlockView(.lazyHGrid)
        }
    }
}

#Preview {
    TopicLazyHGrid()
}
