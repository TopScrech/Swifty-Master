import SwiftUI
import MapKit

struct TopicAlert: View {
    @State private var alertExample = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("In SwiftUI, you can present an alert by using the .alert modifier, which displays an alert with a title, message, and optional actions when the button is tapped")
            
            TopicActionButton("Present an alert", color: .blue.opacity(0.3)) {
                alertExample = true
            }
            
            CodeBlockView(.alert)
        }
        .alert("Title", isPresented: $alertExample) {
            Button("Destructive buttton", role: .destructive) {}
        } message: {
            Text("Message")
        }
    }
}

#Preview {
    TopicAlert()
}
