import SwiftUI

struct TopicDetectLaguage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Detect language")
            
            CodeBlockView(.detectLanguage)
        }
    }
}

#Preview {
    TopicDetectLaguage()
}
