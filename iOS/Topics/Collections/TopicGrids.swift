import SwiftUI

struct TopicGrids: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Grid arranges views in rows and columns, giving you flexible control over layout without lazy loading")
            
            CodeBlockView(.grid)
            
            TopicDisclosureGroup("Lazy Grids") {
                Text("Arrange views in a lazy grid, loading items only as they appear on screen for better performance")
                    .padding(.top)
                
                TopicHeading("LazyVGrid")
                
                CodeBlockView(.lazyVGrid)
                
                TopicHeading("LazyHGrid")
                
                CodeBlockView(.lazyHGrid)
            }
            .padding(.top)
        }
    }
}

#Preview {
    TopicGrids()
}
