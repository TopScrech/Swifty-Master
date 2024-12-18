import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            NavigationLink("Hover Effects") {
                HoverEffects()
            }
            
            NavigationLink("Materials") {
                MaterialsView()
            }
            
            NavigationLink("Gauges") {
                GaugesView()
            }
            
            NavigationLink {
                FeedbackView()
            } label: {
                Label("Sensory Feedback", systemImage: "hand.tap")
                    .foregroundStyle(.foreground)
            }
            
            NavigationLink {
                ImagePickerView()
            } label: {
                Label("Drag & Drop", systemImage: "doc")
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
