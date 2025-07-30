import SwiftUI

struct TopicDocs: View {
    private let docs: [String: String]
    
    init(_ docs: [String: String]) {
        self.docs = docs
    }
    
    var body: some View {
        VStack(spacing: 10) {
            if docs.count > 0 {
                TopicHeading("Docs")
                
                ForEach(Array(docs), id: \.key) { key, value in
                    TopicDocsCard(key, at: value)
                }
            }
        }
    }
}

//#Preview {
//    TopicDocs()
//}
