import Foundation
import Testing
@testable import iOS

struct TopicMappingTests {
    @Test
    func everyTopicHasMetadata() {
        for topic in Topic.allCases {
            let metadata = topic.metadata
            
            #expect(!metadata.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "\(topic.id) has no title")
            #expect(Category.allCases.contains(metadata.category), "\(topic.name) has an unknown category")
            #expect(!metadata.icon.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "\(topic.name) has no icon")
            
            for doc in metadata.docs {
                #expect(!doc.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "\(topic.name) has a doc with no name")
                #expect(isValidURL(doc.url), "\(topic.name) has an invalid doc URL")
                
                if let downloadURL = doc.downloadURL {
                    #expect(isValidURL(downloadURL), "\(topic.name) has an invalid download URL")
                }
            }
            
            for relatedTopic in metadata.related {
                #expect(Topic.allCases.contains(relatedTopic), "\(topic.name) has an unknown related topic")
            }
        }
    }
    
    @Test
    func everyTopicHasAViewOnIOS() {
#if os(iOS)
        for topic in Topic.allCases {
            #expect(topicView(topic) != nil, "\(topic.name) has no topic view")
        }
#endif
    }
    
    @Test
    func topicsDecodeFromStoredTitlesAndIds() throws {
        let decoder = JSONDecoder()
        
        #expect(try decoder.decode(Topic.self, from: Data(#""Text Field""#.utf8)) == .textField)
        #expect(try decoder.decode(Topic.self, from: Data(#""textField""#.utf8)) == .textField)
    }
    
    @Test
    func everyCodeBlockLoadsText() {
        for codeBlock in CodeBlock.allCases {
            let code = codeBlock.code.trimmingCharacters(in: .whitespacesAndNewlines)
            #expect(!code.isEmpty, "\(codeBlock.rawValue) code block is empty or missing")
        }
    }
    
    private func isValidURL(_ urlString: String) -> Bool {
        let components = URLComponents(string: urlString)
        
        return components?.scheme != nil && components?.host != nil
    }
}
