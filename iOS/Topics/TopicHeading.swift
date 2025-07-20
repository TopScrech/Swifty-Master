import SwiftUI

struct TopicHeading: View {
    private let heading: LocalizedStringKey
    
    init(_ heading: LocalizedStringKey) {
        self.heading = heading
    }
    
    var body: some View {
        Text(heading)
            .title2(.semibold, design: .rounded)
            .padding(.top, 32)
    }
}

//#Preview {
//    TopicHeading()
//}
