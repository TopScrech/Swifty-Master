import ScrechKit

struct TopicDifferentiateOS: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Conditional compilation checks let you run different code depending on the platform or environment your app is built for")
            
            Text("In 2025 Apple began aligning the version numbers of all OS releases. In Xcode 27, Swift is taking that even further by letting you condense all of those platform names into one: `anyAppleOS`")
            
            CodeBlockView(.anyAppleOS)
            
            CodeBlockView(.differentiateOS)
            CodeBlockView(.detectDeviceUsed)
        }
    }
}

#Preview {
    TopicDifferentiateOS()
        .darkSchemePreferred()
}
