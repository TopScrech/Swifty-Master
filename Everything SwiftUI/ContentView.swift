import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        List {
            NavigationLink("Materials") {
                MaterialsView()
            }
            
            NavigationLink("Sensory Feedback") {
                FeedbackView()
            }
            
            NavigationLink("Drag and Drop") {
                ImagePickerView()
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
