import SwiftUI

struct BrightnessSlider: View {
    init() {
        _brightness = State(initialValue: Double(UIScreen.main.brightness))
    }
    
    @State private var brightness = 0.0
    
    var body: some View {
        Slider(value: $brightness, in: 0...100, step: 1)
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
    BrightnessSlider()
}
