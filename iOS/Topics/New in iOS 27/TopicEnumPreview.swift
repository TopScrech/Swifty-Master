import ScrechKit

struct TopicEnumPreview: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Enum case previews let a SwiftUI preview run once for each value in a collection of arguments")
            
            CodeBlockView(.enumPreview)
            
            Image(.enumPreview)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 16))
        }
    }
}

#Preview {
    TopicEnumPreview()
        .darkSchemePreferred()
}
