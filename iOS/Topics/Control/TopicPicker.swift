import SwiftUI

struct TopicPicker: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI's Picker is a customizable, interactive way allowing users to select from a list of options")
            
            SimpleCodeBlockView(.picker)
        }
    }
}

#Preview {
    TopicPicker()
        .darkSchemePreferred()
}
