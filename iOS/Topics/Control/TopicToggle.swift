import SwiftUI

struct TopicToggle: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Toggle")
            
            SimpleCodeBlockView("""
struct ContentView: View {
    @State private var toggleIsOn = true
    
    var body: some View {
        Toggle("Toggle label", isOn: $toggleIsOn)
            .tint(.red)
    }
}

""")
        }
    }
}

#Preview {
    TopicToggle()
}
