import ScrechKit

struct TopicLink: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("A Link opens a specified URL in the user’s default browser or associated app")
            
            CodeBlockView(.link)
        }
    }
}

#Preview {
    TopicLink()
        .darkSchemePreferred()
}
