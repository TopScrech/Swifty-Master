import SwiftUI

struct TopicLowPowerMode: View {
    private let lowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Detecting Low Power Mode helps conserve energy and maintain a smooth user experience when the battery is low. SwiftUI apps can adjust behavior by disabling power-intensive features to align with system energy-saving goals")
            
            if lowPowerMode {
                TopicActionButton("Low Power Mode enabled", color: .yellow.opacity(0.2))
                    .glassyBackground()
            } else {
                TopicActionButton("Low Power Mode disabled", color: .green.opacity(0.2))
                    .glassyBackground()
            }
            
            CodeBlockView(.lowPowerMode)
        }
    }
}

#Preview {
    TopicLowPowerMode()
}
