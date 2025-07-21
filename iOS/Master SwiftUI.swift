import ScrechKit

@main
struct MasterSwiftUI: App {
    var body: some Scene {
        WindowGroup {
            NavContainer()
        }
#if os(macOS)
        Settings {
            SettingsView()
        }
#endif
    }
}
