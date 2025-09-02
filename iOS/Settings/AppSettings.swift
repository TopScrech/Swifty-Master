import ScrechKit

struct AppSettings: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Form {
            Text("Settings")
                .largeTitle(.bold, design: .rounded)
                .listRowBackground(Color.clear)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            
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
            }
            
            NavigationLink {
                DebugSettings()
            } label: {
                Label("Debug", systemImage: "hammer")
            }
        }
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
