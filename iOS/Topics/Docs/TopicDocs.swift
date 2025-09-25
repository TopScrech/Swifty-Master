import SwiftUI

struct TopicDocs: View {
    private let docs: [TopicDocType]
    
    init(_ docs: [TopicDocType]) {
        self.docs = docs
    }
    
    var body: some View {
        VStack(spacing: 10) {
            if docs.count > 0 {
                TopicHeading("Docs")
                
                ForEach(docs) {
                    TopicDocsCard($0)
                }
            }
        }
    }
}

//#Preview {
//    TopicDocs()
//}
