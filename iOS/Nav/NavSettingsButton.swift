import ScrechKit

struct NavSettingsButton: View {
    @State private var showsSettings = false

    var body: some View {
        Button("Settings", systemImage: "gear") {
            showsSettings = true
        }
        .labelStyle(.iconOnly)
        .keyboardShortcut("s")
        .sheet($showsSettings) {
            NavigationStack {
                AppSettings()
            }
        }
    }
}
