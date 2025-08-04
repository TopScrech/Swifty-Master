import SwiftUI

struct TopicProgressView: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            ProgressView()
            
            ProgressView("ProgressView with a title")
            
            ProgressView("Linear ProgressView", value: 0.5)
                .progressViewStyle(.linear)
            
            CodeBlockView(.progressView)
        }
    }
}

#Preview {
    ScrollView {
        ContentView(.progressView)
    }
    .darkSchemePreferred()
    .environmentObject(ValueStore())
}
