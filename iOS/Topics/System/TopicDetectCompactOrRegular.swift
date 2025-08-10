import SwiftUI

struct TopicDetectCompactOrRegular: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("@Environment(\\.horizontalSizeClass) lets you detect the available horizontal space class so you can adapt your layout for compact or regular widths")
            
            CodeBlockView(.detectCompactOrRegular)
        }
    }
}

#Preview {
    TopicDetectCompactOrRegular()
}
