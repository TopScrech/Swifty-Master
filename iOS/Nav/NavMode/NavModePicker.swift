import ScrechKit

struct NavModePicker: View {
    @State private var navMode: NavMode?
    @EnvironmentObject private var store: ValueStore
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var appearance
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottom) {
                    Image(.pyzh)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Hi, I'm Pyzh. Let's dive into the world of SwiftUI!")
                        .foregroundStyle(appearance == .dark ? .white : .black)
                        .title2(.semibold, design: .rounded)
                        .multilineTextAlignment(.center)
                        .padding(8)
                        .glassyBackground(16)
                }
                
                Text("but first, choose the interface that's comfortable for you")
                    .secondary()
                    .multilineTextAlignment(.center)
#if !os(tvOS)
                    .frame(width: 300)
                    .fontSize(14)
#endif
                HStack(spacing: 25) {
                    ForEach(NavMode.allCases) {
                        NavModeTile($navMode, mode: $0)
                    }
                }
                .padding(.top)
                
                Spacer()
                
                NavModePickerSaveButton(navMode)
            }
            .scenePadding()
            .background {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(0xE46981).opacity(0.3),
                        .clear,
                        .clear
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            }
        }
#if os(tvOS)
        .background(.background)
#endif
#if os(macOS)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .frame(width: 500, height: 600)
#endif
        .interactiveDismissDisabled(store.navMode == nil)
    }
}

#Preview {
    NavModePicker()
        .environmentObject(ValueStore())
}
