import SwiftUI

struct TopicNavigationLink: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Control button that navigates to a destination view when tapped")
            
            CodeBlockView(.navigationLink)
        }
    }
}

#Preview {
    TopicNavigationLink()
}
