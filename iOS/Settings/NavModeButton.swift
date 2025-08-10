import SwiftUI

struct NavModeButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    
    private var icon: String {
        if store.experience == .stack {
            "list.bullet.rectangle.portrait"
        } else {
            "sidebar.left"
        }
    }
    
    var body: some View {
        @Bindable var nav = nav
        
        Button {
            nav.showExperiencePicker = true
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
