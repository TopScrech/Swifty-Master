import SwiftUI

struct TopicLowPowerMode: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Detect Low Power Mode")
            
            CodeBlockView(.lowPowerMode)
        }
    }
}

#Preview {
    TopicLowPowerMode()
}
