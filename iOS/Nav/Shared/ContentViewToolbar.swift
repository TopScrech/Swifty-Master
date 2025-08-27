import SwiftUI

struct ContentViewToolbar: View {
    var body: some View {
#if os(macOS)
        NavigationLink(destination: AppSettings()) {
            Image(systemName: "gear")
        }
#else
        ToolbarItem(placement: .topBarTrailing) {
            NavigationLink(destination: AppSettings()) {
                Image(systemName: "gear")
            }
        }
#endif
    }
}
