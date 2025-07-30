import SwiftUI

struct TopicLowPowerMode: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Detect Low Power Mode")
            
            SimpleCodeBlockView(.lowPowerMode)
        }
    }
}

#Preview {
    TopicLowPowerMode()
}
