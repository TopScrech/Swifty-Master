import ScrechKit

struct TopicCustomViewModifiers: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Custom view modifiers package repeated styling or behavior into one reusable modifier, which keeps views easier to read and makes design changes safer")
            
            CodeBlockView(.customViewModifiers)
        }
    }
}

#Preview {
    TopicCustomViewModifiers()
        .darkSchemePreferred()
}
