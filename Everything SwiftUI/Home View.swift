import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        List {
            NavigationLink("Hover Effects") {
                HoverEffect()
            }
            
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
        HomeView()
    }
}
