import SwiftUI

struct TopicBadges: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            CodeBlockView(.badges)
        }
    }
}

#Preview {
    TopicBadges()
        .darkSchemePreferred()
}
