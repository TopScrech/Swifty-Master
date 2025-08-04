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
                Toggle("Show status bar", isOn: $store.showStatusBar)
                
                Button {
                    store.favoriteTopics = Topic.allCases
                } label: {
                    HStack {
                        Text("Add all to favorites")
                        
                        Spacer()
                        
                        Image(systemName: "star")
                            .foregroundStyle(.yellow)
                    }
                }
                
                Button(role: .destructive) {
                    store.favoriteTopics = []
                } label: {
                    HStack {
                        Text("Remove all favorites")
                        
                        Spacer()
                        
                        Image(systemName: "star.slash")
                            .secondary()
                    }
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
