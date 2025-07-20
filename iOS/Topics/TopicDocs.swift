import SwiftUI

struct TopicDocs: View {
    private let docs: [String: String]
    
    init(_ docs: [String: String]) {
        self.docs = docs
    }
    
    var body: some View {
        if docs.count > 0 {
            TopicHeading("Documentation")
            
            ForEach(Array(docs), id: \.key) { key, value in
                Text("\(key): \(value)")
            }
        }
    }
}

//#Preview {
//    TopicDocs()
//}
