import SwiftUI

struct TopicSheet: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Sheet")
            
            SimpleCodeBlockView(.sheet)
        }
    }
}

#Preview {
    TopicSheet()
}
