import SwiftUI

struct NavModeButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        
        Button {
            nav.showExperiencePicker = true
        } label: {
            HStack {
                Text("Navigation mode")
                
                Spacer()
                
                Image(systemName: "sidebar.left")
                    .title3()
                    .secondary()
            }
        }
        .help("Choose your navigation experience")
        .sheet($nav.showExperiencePicker) {
            ExperiencePicker($store.experience)
        }
    }
}

#Preview {
    NavModeButton()
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
