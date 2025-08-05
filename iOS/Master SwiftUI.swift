import ScrechKit
import SafariCover

@main
struct MasterSwiftUI: App {
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
