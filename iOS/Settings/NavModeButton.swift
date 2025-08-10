import SwiftUI

struct NavModeButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    private var icon: String {
        if store.navMode == .stack {
            "list.bullet.rectangle.portrait"
        } else {
            "sidebar.left"
        }
    }
    
    var body: some View {
        @Bindable var nav = nav
        
        Button {
            nav.showNavModePicker = true
        } label: {
            HStack {
                Text("Navigation mode")
                
                Spacer()
                
                Image(systemName: icon)
                    .title3()
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
    NavModeButton()
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
