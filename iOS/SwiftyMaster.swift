import ScrechKit

#if canImport(SafariCover)
import SafariCover
#endif

@main
struct SwiftyMaster: App {
    @StateObject private var store = ValueStore()
    
    var body: some Scene {
        WindowGroup {
            NavContainer()
                .environmentObject(store)
        }
#if os(macOS)
        Settings {
            SettingsView()
                .environmentObject(store)
        }
#endif
    }
}
