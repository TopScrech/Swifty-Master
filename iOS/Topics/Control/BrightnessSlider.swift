import SwiftUI

struct BrightnessSlider: View {
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var brightnessPercentage = 0.0
    @State private var screen: UIScreen?
    
    var body: some View {
        Slider(value: $brightnessPercentage, in: 0...100, step: 1)
            .disabled(screen == nil)
            .background {
                BrightnessScreenReaderView(onScreenChange: updateScreen)
            }
            .onChange(of: brightnessPercentage) { _, newValue in
                setDeviceBrightness(newValue)
            }
            .onChange(of: scenePhase) { _, newScenePhase in
                if newScenePhase == .active {
                    updateBrightness(animated: true)
                }
            }
    }
    
    private func updateScreen(_ screen: UIScreen?) {
        self.screen = screen
        updateBrightness(animated: false)
    }
    
    private func updateBrightness(animated: Bool) {
        guard let screen else {
            return
        }
        
        let currentBrightness = Double(screen.brightness * 100)
        
        if animated {
            withAnimation {
                brightnessPercentage = currentBrightness
            }
        } else {
            brightnessPercentage = currentBrightness
        }
    }
    
    private func setDeviceBrightness(_ brightnessPercentage: Double) {
        screen?.brightness = CGFloat(brightnessPercentage / 100)
    }
}

#Preview {
    BrightnessSlider()
        .darkSchemePreferred()
}
