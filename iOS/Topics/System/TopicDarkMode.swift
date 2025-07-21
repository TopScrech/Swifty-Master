import SwiftUI

struct TopicDarkMode: View {
    var body: some View {
        VStack {
            SimpleCodeBlockView(.darkMode)
        }
    }
}

#Preview {
    TopicDarkMode()
}
