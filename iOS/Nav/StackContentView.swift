// The content view for the navigation stack view experience

import SwiftUI

struct StackContentView: View {
    @Environment(NavModel.self) private var nav
    @Environment(DataModel.self) private var dataModel
    
    private let categories = Category.allCases
    
    var body: some View {
        @Bindable var nav = nav
        
        NavigationStack(path: $nav.topicPath) {
            List(categories) { category in
                Section {
                    ForEach(dataModel.topics(in: category)) { topic in
                        NavigationLink(value: topic) {
                            Label {
                                Text(topic.name)
                            } icon: {
                                Image(systemName: topic.icon)
                                    .rotationEffect(.degrees(topic == .lazyVGrid ? 90 : 0))
                            }
                            .labelReservedIconWidth(16)
                        }
                    }
                } header: {
                    Text(category.localizedName)
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
                .experienceToolbar()
            }
        }
    }
}

#Preview {
    StackContentView()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
}
