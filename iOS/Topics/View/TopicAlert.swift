import SwiftUI

struct TopicAlert: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("In SwiftUI, you can present an alert by using the .alert modifier, which displays an alert with a title, message, and optional actions when the button is tapped")
            
            SimpleCodeBlockView(.alert)
        }
    }
}

#Preview {
    TopicAlert()
}
