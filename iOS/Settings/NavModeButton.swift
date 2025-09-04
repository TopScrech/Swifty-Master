import ScrechKit

struct NavModeButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        let icon = store.navMode?.icon ?? ""
        let navMode = store.navMode?.name ?? ""
        
        Button {
            nav.showNavModePicker = true
        } label: {
            HStack {
                Label("Navigation mode", systemImage: icon)
                
                Spacer()
                
                Text(navMode)
                    .secondary()
            }
        }
        .help("Choose your navigation experience")
        .sheet($nav.showNavModePicker) {
            NavModePicker()
        }
    }
}

#Preview {
    List {
        NavModeButton()
    }
    .environment(NavModel.shared)
    .environmentObject(ValueStore())
}
