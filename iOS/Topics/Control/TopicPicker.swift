import SwiftUI

struct TopicPicker: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI's Picker is a customizable, interactive way allowing users to select from a list of options")
            
            CodeBlockView(.picker)
        }
    }
}

#Preview {
    TopicPicker()
        .darkSchemePreferred()
}
