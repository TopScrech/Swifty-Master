import SwiftUI

struct TopicScrollView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("ScrollView allows content to be scrolled horizontally or vertically when it doesn’t fit within the available space")
            
            CodeBlockView(.scrollView)
        }
    }
}

#Preview {
    TopicScrollView()
}
