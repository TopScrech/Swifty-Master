import SwiftUI

struct TopicDarkMode: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("The @Environment(\\.colorScheme) property lets you detect whether the system is in light or dark mode so you can adjust your UI accordingly")
            
            CodeBlockView(.darkMode)
            
            Text("The .preferredColorScheme(_:) modifier forces a view to display in a specific color scheme, regardless of the system setting")
            
            CodeBlockView(.darkModeLock)
        }
    }
}

#Preview {
    TopicDarkMode()
}
