import SwiftUI

extension View {
    func navContainerToolbar() -> some View {
#if os(macOS)
        self
#else
        self
            .toolbar {
                NavSettingsButton()
            }
#endif
    }
}
