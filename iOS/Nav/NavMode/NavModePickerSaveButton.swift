import ScrechKit

struct NavModePickerSaveButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    @Environment(\.dismiss) private var dismiss
    
    private let navMode: NavMode?
    
    init(_ navMode: NavMode?) {
        self.navMode = navMode
    }
    
    @State private var trigger = true
    
    var body: some View {
        Button("Save") {
            trigger.toggle()
            dismiss()
            store.navMode = navMode
            nav.showNavModePicker = false
        }
#if !os(visionOS)
        .hapticOn(trigger, as: .success)
#endif
        .title2(.semibold, design: .rounded)
#if os(tvOS)
        .foregroundStyle(.black)
#else
        .foregroundStyle(.background)
#endif
        .buttonSizing(.flexible)
//        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(.primary, in: .rect(cornerRadius: 16))
        .disabled(navMode == nil)
        .buttonStyle(.plain)
    }
}

#Preview {
    NavModePickerSaveButton(.stack)
        .darkSchemePreferred()
        .environment(NavModel())
        .environmentObject(ValueStore())
}
