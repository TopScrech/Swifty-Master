import ScrechKit

struct TopicNavigationLink: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Control button that navigates to a destination view when tapped")
            
            CodeBlockView(.navigationLink)
        }
    }
}

#Preview {
    TopicNavigationLink()
        .darkSchemePreferred()
}
