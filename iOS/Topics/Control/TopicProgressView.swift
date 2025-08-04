import SwiftUI

struct TopicProgressView: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.progressView)
        }
    }
}

#Preview {
    TopicProgressView()
        .darkSchemePreferred()
}
