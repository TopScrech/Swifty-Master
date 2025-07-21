import SwiftUI

struct TopicButton: View {
    private let name: LocalizedStringKey
    private let color: Color
    private let action: () -> Void
    
    init(
        _ name: LocalizedStringKey,
        color: Color,
        action: @escaping () -> Void
    ) {
        self.name = name
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(name)
                .frame(maxWidth: .infinity)
                .semibold()
                .padding(.vertical, 10)
        }
        .buttonStyle(.glassProminent)
        .tint(color)
    }
}

//#Preview {
//    TopicButton()
//}
