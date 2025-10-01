import SwiftUI

struct NavContainerToolbar: ViewModifier {
    func body(content: Content) -> some View {
#if os(macOS)
        content
#else
        content
            .toolbar {
                NavigationLink(destination: AppSettings()) {
                    Image(systemName: "gear")
                }
                .keyboardShortcut("s")
            }
#endif
    }
}

extension View {
    func navContainerToolbar() -> some View {
        modifier(NavContainerToolbar())
    }
}
