import SwiftUI

struct TopicStepper: View {
    @State private var stepperValue = 0
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Stepper is a customizable slider control that allows to select a value from a range, providing a simple and intuitive way to adjust settings or display progress")
            
            Stepper(value: $stepperValue, in: 0...Int.max) {
                Text("Stepper: \(stepperValue)")
            }
            .padding()
            .glassyBackground(16)
            
            CodeBlockView(.stepper)
        }
    }
}

#Preview {
    TopicStepper()
}
