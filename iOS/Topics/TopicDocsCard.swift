import SwiftUI

struct TopicDocsCard: View {
    private let title: String
    private let link: String
    
    init(_ title: String, at link: String) {
        self.title = title
        self.link = link
    }
    
    var body: some View {
        if let url = URL(string: link) {
            Link(destination: url) {
                HStack(spacing: 12) {
                    TopicDocsCardImage(link)
                    
                    Text(title)
                        .bold()
                        .rounded()
                        .lineLimit(2)
                        .foregroundStyle(.foreground)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                .padding(10)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
            }
            .contextMenu {
                Button {
                    
                }
            }
        }
    }
}

#Preview {
    TopicDocsCard("Preview", at: "https://developer.apple.com/documentation/swiftui/toggle")
        .darkSchemePreferred()
        .scenePadding()
}
