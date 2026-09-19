import SwiftUI

struct NavSettingsButton: View {
    @State private var showsSettings = false

    var body: some View {
        Button("Settings", systemImage: "gear") {
            showsSettings = true
        }
        .labelStyle(.iconOnly)
        .keyboardShortcut("s")
        .sheet(isPresented: $showsSettings) {
            NavigationStack {
                AppSettings()
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                showsSettings = false
                            }
                        }
                    }
            }
        }
    }
}
