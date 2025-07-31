import SwiftUI

struct TopicImage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Image is used to display visual content such as icons, photo's, or system-provided images")
            
            CodeBlockView(.image)
        }
    }
}

#Preview {
    TopicImage()
}
