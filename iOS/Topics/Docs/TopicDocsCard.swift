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
                
                VStack(alignment: .leading) {
                    Text(doc.name)
                        .bold()
                        .rounded()
                        .lineLimit(2)
                        .foregroundStyle(.foreground)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    if let details = doc.details {
                        Text(details)
                            .footnote()
                            .secondary()
                    }
                }
            }
        }
        .buttonStyle(.plain)
        .padding(10)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
#if os(iOS) || os(visionOS)
        .safariCover($safariCover, url: doc.url)
#endif
#if !os(tvOS)
        .contextMenu {
            if let url = URL(string: doc.url) {
                Button("Copy", systemImage: "document.on.document") {
                    Pasteboard.copy(url)
                }
                
                ShareLink(item: url)
            }
            
            if let downloadURLString = doc.downloadURL,
               let downloadURL = URL(string: downloadURLString) {
                Link(destination: downloadURL) {
                    Label("Download linked resource", systemImage: "square.and.arrow.down")
                }
            }
        }
#endif
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
