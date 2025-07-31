import SwiftUI

struct TopicDarkMode: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("The ContentView struct uses the @Environment(\\.colorScheme) property wrapper to access the current color scheme environment variable, which determines whether the app is in Dark or Light mode")
            
            CodeBlockView(.darkMode)
        }
    }
}

#Preview {
    TopicDarkMode()
}
