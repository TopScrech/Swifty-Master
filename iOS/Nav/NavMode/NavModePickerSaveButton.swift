import ScrechKit

struct NavModePickerSaveButton: View {
    @Environment(NavModel.self) private var nav
    @EnvironmentObject private var store: ValueStore
    @Environment(\.dismiss) private var dismiss
    
    private let navMode: NavMode?
    
    init(_ navMode: NavMode?) {
        self.navMode = navMode
    }
    
    var body: some View {
        Button("Save") {
            dismiss()
            store.navMode = navMode
            nav.showNavModePicker = false
        }
        .title2(.semibold, design: .rounded)
#if os(tvOS)
        .foregroundStyle(.black)
#else
        .foregroundStyle(.background)
#endif
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(.primary, in: .rect(cornerRadius: 16))
        .disabled(navMode == nil)
        .buttonStyle(.plain)
    }
}

#Preview {
    NavModePickerSaveButton(.stack)
        .environment(NavModel())
        .environmentObject(ValueStore())
}
