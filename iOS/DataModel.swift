import SwiftUI

@Observable
final class DataModel {
    private let topics = Topic.allCases
    private var topicsById: [Topic.ID: Topic] = [:]
    
    var searchPrompt = ""
    
    /// The shared singleton data model object
    static let shared = {
        DataModel()
    }()
    
    var filteredCategories: [Category] {
        filteredCategories()
    }
    
    func filteredCategories(excluding excludedTopics: Set<Topic> = []) -> [Category] {
        if searchPrompt.isEmpty {
            Category.allCases
        } else {
            Category.allCases.filter {
                topics(in: $0, excluding: excludedTopics).contains {
                    $0.name.localizedStandardContains(searchPrompt)
                }
            }
        }
    }
    
    /// The topics for a given category, sorted by name
    func topics(in category: Category?) -> [Topic] {
        topics(in: category, excluding: [])
    }
    
    func topics(in category: Category?, excluding excludedTopics: Set<Topic>) -> [Topic] {
        topics.filter {
            $0.category == category && !excludedTopics.contains($0)
        }
    }
    
    func topics(foundIn category: Category?) -> [Topic] {
        topics(foundIn: category, excluding: [])
    }
    
    func topics(foundIn category: Category?, excluding excludedTopics: Set<Topic>) -> [Topic] {
        let categoryTopics = topics(in: category, excluding: excludedTopics)
        
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
