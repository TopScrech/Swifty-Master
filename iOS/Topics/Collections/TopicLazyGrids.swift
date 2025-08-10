import SwiftUI

struct TopicLazyGrids: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Arrange views in a lazy grid, loading items only as they appear on screen for better performance")
            
            TopicHeading("LazyVGrid")
            
            CodeBlockView(.lazyVGrid)
            
            TopicHeading("LazyHGrid")
            
            CodeBlockView(.lazyHGrid)
        }
    }
}

#Preview {
    TopicLazyGrids()
}
