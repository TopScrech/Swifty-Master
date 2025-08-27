import SwiftUI

struct DebugSettings: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        List {
            Section {
                Button("Reset nav mode") {
                    store.navMode = nil
                }
                
                Toggle("Status bar", isOn: $store.showStatusBar)
            }
            
            Section {
                Button("Glassy icon") {
                    UIApplication.shared.setAlternateIconName("Liquid Glass")
                }
                
                Button("Reset icon") {
                    UIApplication.shared.setAlternateIconName(nil)
                }
            }
            
            DebugSettingsFavorites()
            
            DebugSettingsAllCodeBlocks()
        }
        .navigationTitle("Debug")
        .foregroundStyle(.foreground)
    }
}

#Preview {
    NavigationStack {
        DebugSettings()
    }
    .environmentObject(ValueStore())
}
