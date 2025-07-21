import SwiftUI

struct TopicSlider: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicSlider")
        }
    }
}

#Preview {
    TopicSlider()
        .darkSchemePreferred()
}
