import SwiftUI

struct TopicDetectLaguage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Bundle.main.preferredLocalizations returns the app’s preferred language codes, which you can use to adjust content or behavior based on the user’s locale")
            
            CodeBlockView(.detectLanguage)
        }
    }
}

#Preview {
    TopicDetectLaguage()
}
