import SwiftUI

struct TopicDocsCardImage: View {
    private let link: String
    
    init(_ link: String) {
        self.link = link
    }
    
    private var image: ImageResource? {
        switch true {
        case link.contains("human-interface-guidelines"): .appleGuidelines
        case link.contains("developer.apple"): .apple
        default: nil
        }
    }
    
    var body: some View {
        if let image {
            Image(image)
                .resizable()
                .frame(32)
        }
    }
}

#Preview {
    TopicDocsCardImage("apple")
        .darkSchemePreferred()
}
