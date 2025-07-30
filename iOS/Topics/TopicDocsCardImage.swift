import SwiftUI

struct TopicDocsCardImage: View {
    private let link: String
    
    init(_ link: String) {
        self.link = link
    }
    
    private var image: ImageResource? {
        switch true {
        case link.contains("developer.apple"): .apple
        default: nil
        }
    }
    
    var body: some View {
        if let image {
            Image(image)
                .resizable()
                .frame(40)
        }
    }
}

#Preview {
    TopicDocsCardImage("apple")
        .darkSchemePreferred()
}
