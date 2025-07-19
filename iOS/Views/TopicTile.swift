import SwiftUI

struct TopicTile: View {
    private var recipe: Topic
    
    init(_ recipe: Topic) {
        self.recipe = recipe
    }
    
    @State private var isHovering = false
    
    var body: some View {
        VStack(alignment: .leading) {            
            Text(recipe.name)
                .lineLimit(2, reservesSpace: true)
        }
        .tint(.primary)
        .scaleEffect(CGSize(width: scale, height: scale))
        .onHover {
            isHovering = $0
        }
    }
    
    private var scale: CGFloat {
        isHovering ? 1.05 : 1
    }
}

//#Preview() {
//    TopicTile(.mock)
//}
