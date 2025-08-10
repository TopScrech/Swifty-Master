import SwiftUI

struct TopicWarning: View {
    private let warning: LocalizedStringKey
    private let color: Color
    
    init(_ warning: LocalizedStringKey, color: Color = .yellow) {
        self.warning = warning
        self.color = color
    }
    
    var body: some View {
        HStack {
            Capsule()
                .fill(color.gradient)
                .frame(width: 5)
            
            Text(warning)
                .padding(.vertical)
            
            Spacer()
        }
        .frame(minHeight: 64, maxHeight: .infinity)
        .clipShape(.rect(cornerRadius: 16))
        .glassyBackground(16)
    }
}

#Preview {
    TopicWarning("Preview")
        .padding()
        .darkSchemePreferred()
}
