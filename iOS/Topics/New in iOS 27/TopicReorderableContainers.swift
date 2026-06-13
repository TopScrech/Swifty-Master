import ScrechKit

struct TopicReorderableContainers: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Reorderable containers let you add drag reordering to custom layouts by marking the dynamic content as reorderable and applying each reorder difference to your data source")
            
            CodeBlockView(.reorderableContainers)
        }
    }
}

#Preview {
    TopicReorderableContainers()
        .darkSchemePreferred()
}
