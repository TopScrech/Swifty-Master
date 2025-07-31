import SwiftUI

struct TopicStepper: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Stepper is a customizable slider control that allows to select a value from a range, providing a simple and intuitive way to adjust settings or display progress")
            
            CodeBlockView(.stepper)
        }
    }
}

#Preview {
    TopicStepper()
        .darkSchemePreferred()
}
