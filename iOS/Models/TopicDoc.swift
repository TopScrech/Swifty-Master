import Foundation

struct TopicDocType: Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let details: String?
    let url: String
    let downloadURL: String?
    
    init(
        _ name: String,
        details: String? = nil,
        url: String,
        downloadURL: String? = nil
    ) {
        self.name = name
        self.details = details
        self.url = url
        self.downloadURL = downloadURL
    }
}

extension Topic {
    var docs: [TopicDocType] {
        metadata.docs
    }
}
