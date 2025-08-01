import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Form {
            Section {
                Toggle("Show code line numbers", isOn: $store.showCodeLineNumbers)
            }
            
            Section {
                ExperienceButton()
            }
            
            Picker("Color theme", selection: $store.colorTheme) {
                ForEach(ColorTheme.allCases) { theme in
                    Text(theme.loc)
                        .tag(theme)
                }
            }
#if DEBUG
            Section("Debug") {
                Button("Remove all favorites", role: .destructive) {
                    store.favoriteTopics = []
                }
            }
#endif
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
