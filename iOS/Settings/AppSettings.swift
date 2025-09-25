import ScrechKit

struct AppSettings: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Form {
            Section {
#if !os(visionOS)
                SettingsAppearancePicker()
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
                Button {
                    openSettings()
                } label: {
                    Label {
                        Text("Change language")
                        Text("English, Dutch, Russian")
                    } icon: {
                        Image(systemName: "globe")
                    }
                }
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
    .environment(NavModel())
    .environmentObject(ValueStore())
}
