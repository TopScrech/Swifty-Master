import SwiftUI

extension View {
    func navContainerToolbar() -> some View {
#if os(macOS)
        self
#else
        self
            .toolbar {
                NavigationLink(destination: AppSettings()) {
                    Image(systemName: "gear")
                }
                .keyboardShortcut("s")
                .frame(32)
            }
#endif
    }
}
