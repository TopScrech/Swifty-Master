import SwiftUI

struct TopicStepper: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicStepper")
        }
    }
}

#Preview {
    TopicStepper()
        .darkSchemePreferred()
}
