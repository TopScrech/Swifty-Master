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
            
            NavigationLink("Gauges") {
                GaugesView()
            }
            
            NavigationLink("App Store Overlay") {
                AppStoreOverlay()
            }
            
#if !os(visionOS)
            NavigationLink {
                FeedbackView()
            } label: {
                Label("Sensory Feedback", systemImage: "hand.tap")
                    .foregroundStyle(.foreground)
            }
#endif
            
            Section {
                NavigationLink {
                    ImagePickerView()
                } label: {
                    Label("Drag & Drop", systemImage: "doc")
                        .foregroundStyle(.foreground)
                }
                
                NavigationLink {
                    Image_Picker()
                } label: {
                    Label("Picker 2", systemImage: "doc")
                        .foregroundStyle(.foreground)
                }
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
