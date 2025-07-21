import SwiftUI

struct TopicSlider: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Slider is a customizable UI control that allows users to select a value from a continuous range")
            
            SimpleCodeBlockView(.slider)
        }
    }
}

#Preview {
    TopicSlider()
        .darkSchemePreferred()
}
