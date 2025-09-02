import ScrechKit

#if canImport(SafariCover)
import SafariCover
#endif

@main
struct SwiftyMaster: App {
    private var nav: NavModel = .shared
    @StateObject private var store = ValueStore()
    
    var body: some Scene {
        WindowGroup {
            NavContainer()
                .environment(nav)
                .environmentObject(store)
        }
#if os(macOS)
        Settings {
            AppSettings()
                .environment(nav)
                .environmentObject(store)
        }
#endif
    }
}
