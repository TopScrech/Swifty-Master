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
                
                ForEach(docs) { doc in
                    TopicDocsCard(doc)
                }
            }
        }
    }
}

//#Preview {
//    TopicDocs()
//}
