import SwiftUI

struct TopicDisclosureGroup<Content: View>: View {
    private let title: String
    private let content: () -> Content
    
    init(
        _ title: String,
        isExpanded: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.isExpanded = isExpanded
        self.content = content
    }
    
    @State private var isExpanded = true
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            VStack(spacing: 25, content: content)
                .padding(5)
        } label: {
            Text(title)
                .title3(.semibold, design: .rounded)
                .foregroundStyle(.foreground)
        }
    }
}
