import SwiftUI

struct TopicAlert: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("TopicAlert")
            
            SimpleCodeBlockView(.alert)
        }
    }
}

#Preview {
    TopicAlert()
}
