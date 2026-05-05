import ScrechKit

#if canImport(Appearance)
import Appearance
#endif

struct AppSettings: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Form {
            Section {
#if canImport(Appearance)
                AppearancePicker($store.appearance)
#endif
                Toggle(isOn: $store.showCodeLineNumbers) {
                    Label("Code line numbers", systemImage: "list.number")
                }
                
                Toggle(isOn: $store.favoriteArticlesBadge) {
                    Label("Favorite articles badge", systemImage: "app.badge")
                    Text("Displayed on top of the tab bar")
                }
            }
            
            Section {
                NavModeButton()
#if !os(visionOS)
                Toggle(isOn: $store.builtInBrowser) {
                    Label("Use built-in Safari", systemImage: "safari")
                }
#endif
#if !os(macOS)
                Button("Change language", systemImage: "globe") {
                    openSettings()
                }
#endif
            }
            
            NavigationLink {
                DebugSettings()
            } label: {
                Label("Debug", systemImage: "hammer")
            }
        }
        .navigationTitle("Settings")
        .formStyle(.grouped)
        .buttonStyle(.plain)
        .scrollIndicators(.never)
    }
}

#Preview {
    NavigationStack {
        AppSettings()
    }
    .darkSchemePreferred()
    .environment(NavModel())
    .environmentObject(ValueStore())
}
