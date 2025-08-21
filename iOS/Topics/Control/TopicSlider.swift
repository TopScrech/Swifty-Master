import SwiftUI

struct TopicSlider: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Slider is a customizable UI control that allows users to select a value from a continuous range")      
#if !os(visionOS)
            BrightnessSlider()
#endif
            CodeBlockView(.slider)
        }
    }
}

#Preview {
    TopicSlider()
}
