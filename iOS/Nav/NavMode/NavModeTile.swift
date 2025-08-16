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
                Image(systemName: mode.icon)
                    .secondary()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .fontSize(mode == .stack ? 100 : 116)
            }
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 16))
            .overlay {
                if selection == mode {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.white, lineWidth: 2)
                }
            }
            .foregroundStyle(.foreground)
        }
        .buttonStyle(.plain)
        .contentShape(.rect)
    }
}
