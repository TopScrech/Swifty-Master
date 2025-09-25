import SwiftUI

struct SettingsAppearancePicker: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Picker(selection: $store.appearance) {
            ForEach(ColorTheme.allCases) {
                Text($0.loc)
                    .tag($0)
            }
        } label: {
            Label("Appearance", systemImage: "paintbrush")
        }
    }
}

#Preview {
    Form {
        SettingsAppearancePicker()
    }
    .formStyle(.grouped)
    .buttonStyle(.plain)
    .environmentObject(ValueStore())
}
