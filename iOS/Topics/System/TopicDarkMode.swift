import SwiftUI

struct TopicDarkMode: View {
    var body: some View {
        VStack {
            SimpleCodeBlockView("""
struct ContentView: View {
    @Environment(\\.colorScheme) private var colorScheme
    
    var body: some View {
        Text(colorScheme == .dark ? "Dark" : "Light"
    }
}
""")
        }
    }
}

#Preview {
    TopicDarkMode()
}
