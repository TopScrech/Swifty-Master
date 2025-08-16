import SwiftUI

struct NavModePicker: View {
    @EnvironmentObject private var store: ValueStore
    @Environment(\.dismiss) private var dismiss
    
    @State private var newNavMode: NavMode?
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottom) {
                    Image(.pyzh)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Hi, I'm Pyzh. Let's dive into the world of SwiftUI!")
                        .title2(.semibold, design: .rounded)
                        .multilineTextAlignment(.center)
                        .padding(8)
                        .glassyBackground(16)
                        .foregroundStyle(.white)
                }
                
                Text("but first, choose the interface that's comfortable for you")
                    .fontSize(14)
                    .secondary()
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                
                HStack(spacing: 25) {
                    ForEach(NavMode.allCases) { mode in
                        NavModeTile(
                            selection: $newNavMode,
                            mode: mode
                        )
                    }
                }
                .padding(.top)
                
                Spacer()
                
                Button("Save") {
                    dismiss()
                    store.navMode = newNavMode
                }
                .title2(.semibold, design: .rounded)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.white, in: .rect(cornerRadius: 16))
                .disabled(store.navMode == nil)
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
#if os(macOS)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .frame(width: 600, height: 350)
#endif
        .interactiveDismissDisabled(store.navMode == nil)
    }
}

#Preview {
    NavModePicker()
        .darkSchemePreferred()
        .environment(NavModel())
        .environmentObject(ValueStore())
}
