import SwiftUI

struct ExperienceButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        
        Button("Nav mode") {
            nav.showExperiencePicker = true
        }
        .help("Choose your navigation experience")
        .sheet($nav.showExperiencePicker) {
            ExperiencePicker($store.experience)
        }
    }
}

#Preview {
    ExperienceButton()
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
