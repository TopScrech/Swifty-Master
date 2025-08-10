import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Form {
            Section {
                Toggle("Code line numbers", isOn: $store.showCodeLineNumbers)
                
                Toggle(isOn: $store.favoriteArticlesBadge) {
                    Text("Favorite articles badge")
                    Text("Displayed on top of the tab bar")
                }
            }
            
            Section {
                NavModeButton()
            }
            
            Picker("Appearance", selection: $store.colorTheme) {
                ForEach(ColorTheme.allCases) { theme in
                    Text(theme.loc)
                        .tag(theme)
                }
            }
            
            Toggle("Use built-in Safari", isOn: $store.builtInBrowser)
            
            DebugSettings()
        }
        .navigationTitle("Settings")
        .formStyle(.grouped)
        .buttonStyle(.plain)
        .scrollIndicators(.never)
    }
}

#Preview {
    SettingsView()
}
