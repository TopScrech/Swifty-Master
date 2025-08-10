import SwiftUI

struct TopicImage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Image is used to display visual content such as icons, photo's, or system-provided images")
            
            CodeBlockView(.image)
            
            TopicDisclosureGroup("SF Symbols") {
                Text("SF Symbols provide a convenient and modern way to incorporate Apple's icons into your app, enhancing user experience with intuitive and visually appealing designs. These icons support localization and animations")
                    .padding(.top)
                
                TopicWarning("Make sure to choose available symbols for your minimum target version")
                
                CodeBlockView(.sfSymbols)
            }
            .padding(.top)
        }
    }
}

#Preview {
    TopicImage()
}
