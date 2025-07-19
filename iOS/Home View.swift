import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            NavigationLink("Loc") {
                PluralTranslation()
            }
            
            NavigationLink("Markdown") {
                Markdown()
            }
            
            NavigationLink("Hover Effects") {
                HoverEffects()
            }
#if !os(visionOS)
            NavigationLink("Materials") {
                MaterialsView()
            }
#endif
            NavigationLink {
                GaugesView()
            } label: {
                Label("Gauges", systemImage: "gauge.with.needle")
            }
            
            NavigationLink("App Store Overlay") {
                AppStoreOverlay()
            }
#if !os(visionOS)
            NavigationLink {
                FeedbackView()
            } label: {
                Label("Sensory Feedback", systemImage: "hand.tap")
            }
#endif
            Section {
                NavigationLink {
                    ImagePickerView()
                } label: {
                    Label("Drag & Drop", systemImage: "doc")
                }
                
                NavigationLink {
                    Image_Picker()
                } label: {
                    Label("Picker 2", systemImage: "doc")
                }
            }
            
            NavigationLink {
                FontList()
            } label: {
                Label("Font sizes", systemImage: "textformat.size")
            }
        }
        .navigationTitle("Master SwiftUI")
        .foregroundStyle(.foreground)
        .labelIconToTitleSpacing(8)
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
    .darkSchemePreferred()
}
