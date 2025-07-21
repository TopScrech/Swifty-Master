import SwiftUI

struct TopicPicker: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicPicker")
        }
    }
}

#Preview {
    TopicPicker()
        .darkSchemePreferred()
}
