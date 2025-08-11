import SwiftUI

struct TopicSpacer: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Spacer() is an element that takes up as much space as it can in a layout")
            
            CodeBlockView(.spacer)
            
            TopicHeading("Spacer with a minimum size")
            
            TopicWarning("Keep in mind that a Spacer has a minimum length \(Text("not").underline()) equal to 0 by default")
            
            CodeBlockView(.spacerMinLenght)
            
            TopicHeading("Spacer with a fixed size")
            
            CodeBlockView(.spacerFixedSize)
        }
    }
}

#Preview {
    TopicSpacer()
}
