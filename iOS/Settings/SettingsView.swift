import SwiftUI

struct SettingsView: View {
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
#if DEBUG
            DebugSettings()
#endif
        }
        .formStyle(.grouped)
        .buttonStyle(.plain)
        .scrollIndicators(.never)
        .ornamentDismissButton()
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
    .environment(NavModel())
    .environmentObject(ValueStore())
}
