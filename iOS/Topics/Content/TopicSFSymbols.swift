import SwiftUI

struct TopicSFSymbols: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("SF Symbols provide a convenient and modern way to incorporate Apple's icons into your app, enhancing user experience with intuitive and visually appealing designs. These icons support localization and animations")
            
            Text("⚠️ Make sure to choose available symbols for your minimum target version")
            
            CodeBlockView(.sfSymbols)
        }
    }
}

#Preview {
    TopicSFSymbols()
}
