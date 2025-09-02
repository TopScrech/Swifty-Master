import SwiftUI

@Observable
final class DataModel {
    private let topics = Topic.allCases
    private var topicsById: [Topic.ID: Topic] = [:]
    
    var searchPrompt = ""
    
    var filteredCategories: [Category] {
        if searchPrompt.isEmpty {
            Category.allCases
        } else {
            Category.allCases.filter {
                topics(in: $0).contains {
                    $0.name.localizedStandardContains(searchPrompt)
                }
            }
        }
    }
    
    /// The shared singleton data model object
    static let shared = {
        DataModel()
    }()
    
    /// The topics for a given category, sorted by name
    func topics(in category: Category?) -> [Topic] {
        topics.filter {
            $0.category == category
        }
    }
    
    func topics(foundIn category: Category?) -> [Topic] {
        let categoryTopics = topics.filter {
            $0.category == category
        }
        
        if searchPrompt.isEmpty {
            return categoryTopics
        } else {
            return categoryTopics.filter {
                $0.name.localizedStandardContains(searchPrompt)
            }
        }
    }
    
    /// The related topics for a given topic, sorted by name
    func topics(relatedTo topic: Topic) -> [Topic] {
        topics.filter {
            topic.related.contains($0)
        }
    }
    
    /// Accesses the topic associated with the given unique identifier
    /// if the identifier is tracked by the data model; otherwise, returns `nil`
    subscript(topicId: Topic.ID) -> Topic? {
        topicsById[topicId]
    }
}
