import SwiftUI

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    private let categories = Category.allCases
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationStack(path: $nav.topicPath) {
            List(categories) { category in
                Section(category.localizedName) {
                    ForEach(dataModel.topics(in: category)) { topic in
                        NavigationLink(value: topic) {
                            TopicLinkLabel(topic)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
            .experienceToolbar()
            .navigationDestination(for: Topic.self) { topic in
                TopicDetail(topic) { relatedTopic in
                    Button {
                        nav.topicPath.append(relatedTopic)
                    } label: {
                        TopicTile(relatedTopic)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    StackContentView()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
}
