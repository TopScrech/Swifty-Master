import SwiftUI

struct AppStoreOverlay: View {
    @State private var overlay = false
    
    var body: some View {
        List {
            Button("Present") {
                overlay = true
            }
        }
        .codeBlock(.appStoreOverlay)
#if os(iOS) || os(visionOS)
        .appStoreOverlay($overlay, id: "1639409934")
#endif
    }
}

#Preview {
    AppStoreOverlay()
}
