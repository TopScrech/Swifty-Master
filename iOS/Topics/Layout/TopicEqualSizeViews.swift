import SwiftUI

struct TopicEqualSizeViews: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Setting .frame(maxWidth: .infinity) makes views expand equally within their container, ensuring consistent sizing across items")
            
            CodeBlockView(.equalSizeViews)
        }
    }
}

#Preview {
    TopicEqualSizeViews()
}
