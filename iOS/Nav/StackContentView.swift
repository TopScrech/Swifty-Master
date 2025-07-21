// The content view for the navigation stack view experience

import SwiftUI

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    @AppStorage("lastVisibleTopicID") var lastVisibleTopicID: String?
    
    private let categories = Category.allCases
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationStack(path: $nav.topicPath) {
            ScrollViewReader { proxy in
                List(categories) { category in
                    Section(category.localizedName) {
                        ForEach(dataModel.topics(in: category)) { topic in
                            NavigationLink(value: topic) {
                                TopicLinkLabel(topic)
                            }
                            .id(topic.id)
                            .onAppear {
                                lastVisibleTopicID = topic.id
                            }
                        }
                    }
                }
                .onAppear {
                    if let id = lastVisibleTopicID {
                        proxy.scrollTo(id, anchor: .top)
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
