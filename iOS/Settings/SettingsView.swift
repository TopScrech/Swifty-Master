import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Form {
            Section {
                Toggle("Code line numbers", isOn: $store.showCodeLineNumbers)
            }
            
            Section {
                NavModeButton()
            }
            
            Picker("Color theme", selection: $store.colorTheme) {
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
