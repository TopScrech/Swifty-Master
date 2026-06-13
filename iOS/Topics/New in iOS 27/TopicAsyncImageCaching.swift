import ScrechKit

struct TopicAsyncImageCaching: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Starting in iOS 27, AsyncImage automatically caches downloaded image data using standard HTTP caching, and you can pass a URLRequest when you want to choose a cache policy")
            
            CodeBlockView(.asyncImageCaching)
        }
    }
}

#Preview {
    TopicAsyncImageCaching()
        .darkSchemePreferred()
}
