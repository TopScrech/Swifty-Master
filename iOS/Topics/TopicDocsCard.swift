import SwiftUI

struct TopicDocsCard: View {
    private let title: String
    private let link: String
    
    init(_ title: String, at link: String) {
        self.title = title
        self.link = link
    }
    
    @State private var safariCover = false
    
    var body: some View {
        Button {
            safariCover = true
        } label: {
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
        }
        .padding(10)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
        .safariCover($safariCover, url: link)
        .contextMenu {
            if let url = URL(string: link) {
                Button("Copy", systemImage: "document.on.document") {
                    UIPasteboard.general.url = url
                }
                
                ShareLink(item: url)
            }
        }
    }
}

#Preview {
    TopicDocsCard("Preview", at: "https://developer.apple.com/documentation/swiftui/toggle")
        .darkSchemePreferred()
        .scenePadding()
}
