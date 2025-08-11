import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Form {
            Section {
#if !os(visionOS)
                Picker("Appearance", selection: $store.appearance) {
                    ForEach(ColorTheme.allCases) { theme in
                        Text(theme.loc)
                            .tag(theme)
                    }
                }
#endif
                Toggle("Code line numbers", isOn: $store.showCodeLineNumbers)
                
                Toggle(isOn: $store.favoriteArticlesBadge) {
                    Text("Favorite articles badge")
                    Text("Displayed on top of the tab bar")
                }
            }
            
            Section {
                NavModeButton()
#if !os(visionOS)
                Toggle("Use built-in Safari", isOn: $store.builtInBrowser)
#endif
            }
            
            DebugSettings()
        }
        .navigationTitle("Settings")
        .formStyle(.grouped)
        .buttonStyle(.plain)
        .scrollIndicators(.never)
        .ornamentDismissButton()
    }
}

#Preview {
    SettingsView()
}
