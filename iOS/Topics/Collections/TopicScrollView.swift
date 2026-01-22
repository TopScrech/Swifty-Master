import ScrechKit

struct TopicScrollView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("ScrollView allows content to be scrolled horizontally or vertically when it doesn’t fit within the available space")
            
            CodeBlockView(.scrollView)
            
            TopicHeading("Stretchy image header")
            
            Text("Scale a header image based on its scroll view offset with visualEffect()")
            
            CodeBlockView(.scrollViewStretchyHeader)
            
            NavigationLink {
                StretchyHeaderDemoView()
            } label: {
                Label("Open stretchy header demo", systemImage: "photo.fill")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .frame(height: 52)
                    .background(.thinMaterial, in: .rect(cornerRadius: 16))
            }
            .foregroundStyle(.foreground)
        }
    }
}

#Preview {
    TopicScrollView()
        .darkSchemePreferred()
}
