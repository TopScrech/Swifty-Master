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
                HStack {
                    TopicDocsCardImage(link)
                    
                    Text(title)
                        .title2(.bold, design: .rounded)
                        .lineLimit(2)
                        .foregroundStyle(.foreground)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                .padding(8)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
            }
        }
    }
}

#Preview {
    TopicDocsCard("Preview", at: "https://bisquit.host")
}
