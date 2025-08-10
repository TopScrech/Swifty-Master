import SwiftUI

struct TopicDetectScreenSize: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("UIScreen.main.bounds gives you the screen’s width and height, which you can use to size views dynamically")
            
            CodeBlockView(.detectScreenSize)
        }
    }
}

#Preview {
    TopicDetectScreenSize()
}
