import SwiftUI

struct TopicDarkMode: View {
    var body: some View {
        VStack(spacing: 25) {
            SimpleCodeBlockView(.darkMode)
        }
    }
}

#Preview {
    TopicDarkMode()
}
