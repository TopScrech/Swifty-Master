import ScrechKit

struct TopicShareLink: View {
    private let url = URL(string: "https://swift.org")!

    var body: some View {
        VStack(spacing: 25) {
            Text("A ShareLink lets people share a URL, text, or other transferable items using the system share sheet")

#if !os(tvOS)
            ShareLink(item: url) {
                Label("Share Swift", systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.borderedProminent)
#else
            Text("ShareLink is not available on tvOS")
#endif

            CodeBlockView(.shareLink)
        }
    }
}

#Preview {
    TopicShareLink()
        .darkSchemePreferred()
}
