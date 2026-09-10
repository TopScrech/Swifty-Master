import SwiftUI

struct SidebarNavigationView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
#endif
    
    var body: some View {
#if os(iOS)
        if horizontalSizeClass == .compact {
            CompactSidebarNavigationView()
        } else {
            NativeSidebarNavigationView()
        }
#else
        NativeSidebarNavigationView()
#endif
    }
}

#Preview {
    SidebarNavigationView()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
