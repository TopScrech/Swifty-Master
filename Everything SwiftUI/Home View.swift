import SwiftUI

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
            
            NavigationLink {
                ImagePickerView()
            } label: {
                Label("Drag & Drop", systemImage: "hand.tap")
                    .foregroundStyle(.foreground)
            }
            
            NavigationLink {
                FontList()
            } label: {
                Label("Font sizes", systemImage: "textformat.size")
                    .foregroundStyle(.foreground)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
