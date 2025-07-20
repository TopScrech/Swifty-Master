// An observable data model of topics and miscellaneous groupings

import SwiftUI

@Observable
final class DataModel {
    private let topics = Topic.allCases
    private var topicsById: [Topic.ID: Topic] = [:]
    
    /// The shared singleton data model object
    static let shared: DataModel = {
        DataModel()
    }()
    
    /// The topics for a given category, sorted by name
    func topics(in category: Category?) -> [Topic] {
        topics.filter {
            $0.category == category
        }
    }
    
    /// The related topics for a given topic, sorted by name
    func topics(relatedTo topic: Topic) -> [Topic] {
        topics.filter {
            topic.related.contains($0.id)
        }
    }
    
    /// Accesses the topic associated with the given unique identifier
    /// if the identifier is tracked by the data model; otherwise, returns `nil`
    subscript(topicId: Topic.ID) -> Topic? {
        topicsById[topicId]
    }
}

