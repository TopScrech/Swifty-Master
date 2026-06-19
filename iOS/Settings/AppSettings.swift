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
#if !os(macOS)
                Button("Change language", systemImage: "globe") {
                    openSettings()
                }
#endif
            }
            
            Section {
                Toggle(isOn: $store.showCodeLineNumbers) {
                    Label("Code line numbers", systemImage: "list.number")
                }
#if !os(visionOS)
                Toggle(isOn: $store.builtInBrowser) {
                    Label("Use built-in Safari", systemImage: "safari")
                }
#endif
            }
            
            Section {
                let url = URL(string: "https://github.com/TopScrech/Swifty-Master")!
                
                Link(destination: url) {
                    HStack(spacing: 12) {
                        Image(.gitHub)
                            .resizable()
                            .frame(24)
                            .clipShape(.circle)
                        
                        Text("GitHub")
                    }
                }
                .tint(.primary)
            } footer: {
                Text("Bug reports, feature requests & contributions are always welcome!")
                    .secondary()
            }
        }
        .navigationTitle("Settings")
        .formStyle(.grouped)
        .buttonStyle(.plain)
        .scrollIndicators(.never)
        .toolbar {
            NavigationLink {
                DebugSettings()
            } label: {
                Label("Debug", systemImage: "hammer")
            }
        }
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
