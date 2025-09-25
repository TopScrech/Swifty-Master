import ScrechKit

struct NavModeButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        @Bindable var nav = nav
        
        Button {
            nav.showNavModePicker = true
        } label: {
            HStack {
                Label("Navigation mode", systemImage: store.navMode?.icon ?? "")
                
                Spacer()
                
                Text(store.navMode?.name ?? "")
                    .secondary()
            }
        }
        .help("Choose your navigation experience")
#if os(macOS)
        .sheet($nav.showNavModePicker) {
            NavModePicker()
        }
#else
        .fullScreenCover($nav.showNavModePicker) {
            NavModePicker()
        }
#endif
    }
}

#Preview {
    List {
        NavModeButton()
    }
    .environment(NavModel.shared)
    .environmentObject(ValueStore())
}
