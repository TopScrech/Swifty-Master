import SwiftUI

struct ContentViewRelatedTopics: View {
    private let relatedTopics: [Topic]
    
    init(_ relatedTopics: [Topic]) {
        self.relatedTopics = relatedTopics
    }
    
    var body: some View {
        if relatedTopics.count > 0 {
            VStack(spacing: 10) {
                TopicHeading("Related articles")
                
                ForEach(relatedTopics) { topic in
                    NavigationLink(value: topic) {
                        Label {
                            Text(topic.localizedName)
                        } icon: {
                            Image(systemName: topic.icon)
                                .foregroundStyle(.blue)
                        }
                        .frame(height: 50)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.foreground)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentViewRelatedTopics([])
}
