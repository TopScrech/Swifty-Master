import SwiftUI

struct AppStoreOverlay: View {
    @State private var overlay = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("The App Store overlay lets you promote an app that’s already published on the App Store and even trigger updates for it")
            
            TopicActionButton("Present", color: .blue.opacity(0.2)) {
                overlay = true
            }
            
            CodeBlockView(.appStoreOverlay)
        }
#if os(iOS) || os(visionOS)
        .appStoreOverlay($overlay, id: 1639409934)
#endif
    }
}

#Preview {
    AppStoreOverlay()
}
