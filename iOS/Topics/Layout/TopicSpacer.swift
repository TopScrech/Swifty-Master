import SwiftUI

struct TopicSpacer: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Spacer() is an element that takes up as much space as it can in a layout")
            
            Text("Simple Spacer")
            
            SimpleCodeBlockView(.spacer)
            
            TopicHeading("Spacer with a minimum size")
            
            Text("⚠️ Keep in mind that a Spacer has a minimum length \(Text("not").underline()) equal to 0 by default")
            
            SimpleCodeBlockView("""
Spacer(minLength: 16)

// or

Spacer()
    .minLength(16)
""")
            TopicHeading("Spacer with a fixed size")
            
            SimpleCodeBlockView("""
Spacer()
    .frame(width: 6, height: 6)
""")
        }
    }
}

#Preview {
    TopicSpacer()
}
