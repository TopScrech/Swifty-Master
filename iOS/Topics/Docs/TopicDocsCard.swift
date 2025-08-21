import ScrechKit

struct TopicDocsCard: View {
    @EnvironmentObject private var store: ValueStore
    @Environment(\.openURL) private var openURL
    
    private let doc: TopicDocType
    
    init(_ doc: TopicDocType) {
        self.doc = doc
    }
    
    @State private var safariCover = false
    
    var body: some View {
        Button {
            openLink()
        } label: {
            HStack(spacing: 12) {
                TopicDocsCardImage(doc.url)
                
                Text(doc.name)
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
        .safariCover($safariCover, url: doc.url)
        .contextMenu {
            if let url = URL(string: doc.url) {
                Button("Copy", systemImage: "document.on.document") {
                    Pasteboard.copy(url)
                }
                
                ShareLink(item: url)
            }
        }
    }
    
    private func openLink() {
#if os(visionOS)
        openURLExternally()
#else
        if store.builtInBrowser {
            safariCover = true
        } else {
            openURLExternally()
        }
#endif
    }
    
    private func openURLExternally() {
        if let url = URL(string: doc.url) {
            openURL(url)
        }
    }
}

#Preview {
    TopicDocsCard(.init("Preview", url: "https://developer.apple.com/documentation/swiftui/toggle"))
        .scenePadding()
        .environmentObject(ValueStore())
}
