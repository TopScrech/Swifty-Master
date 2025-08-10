import SwiftUI

struct TopicSlider: View {
    init() {
        _brightness = State(initialValue: Double(UIScreen.main.brightness))
    }
    
    @State private var isOn = true
    @State private var brightness = 0.0
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Slider is a customizable UI control that allows users to select a value from a continuous range")
            
            Slider(value: $brightness, in: 0...100, step: 1)
            
            CodeBlockView(.slider)
        }
        .onChange(of: brightness) { _, newValue in
            let value = CGFloat(newValue / 100)
            setDeviceBrightness(value)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            withAnimation {
                brightness = Double(UIScreen.main.brightness)
            }
        }
    }
    
    private func setDeviceBrightness(_ level: CGFloat) {
#if !os(watchOS)
        UIScreen.main.brightness = level
#endif
    }
}

#Preview {
    TopicSlider()
        .darkSchemePreferred()
}
