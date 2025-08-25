import SwiftUI

struct NavModeTile: View {
    @Binding var selection: NavMode?
    let mode: NavMode
    
    var body: some View {
        Button {
            selection = mode
        } label: {
            VStack {
                Text(mode.name)
                    .rounded()
                    .semibold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
            }
            .frame(160)
            .background {
                Image(mode == .stack ? .stack : .twoColumns)
                    .resizable()
                    .scaledToFit()
                    .offset(y: 50)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 16))
            .overlay {
                if selection == mode {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.primary, lineWidth: 2)
                }
            }
            .foregroundStyle(.foreground)
        }
        .buttonStyle(.plain)
        .contentShape(.rect)
        .buttonBorderShape(.roundedRectangle(radius: 16))
    }
}

#Preview {
    NavModePicker()
        .environment(NavModel())
        .environmentObject(ValueStore())
}
