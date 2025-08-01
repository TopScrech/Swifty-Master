import SwiftUI

struct TopicDismiss: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var hideBackButton = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text(highlightOccurrences(
                in: "You can programmatically go back from any view or close a sheet using the dismiss() environment method",
                target: "dismiss",
                color: Color(0xA167E6)
            ))
            
            TopicActionButton("Dismiss", color: .red.opacity(0.2)) {
                dismiss()
            }
            
            CodeBlockView(.dismiss)
            
            TopicHeading("Hide native back button")
            
            Text(highlightOccurrences(
                in: "Don't worry, you can also disable the native dismiss button by using the view modifier called .navigationBarBackButtonHidden()",
                target: "navigationBarBackButtonHidden",
                color: Color(0xA167E6)
            ))
            
            Toggle("Hide native back button", isOn: $hideBackButton)
                .padding()
#if os(visionOS)
                .background(.ultraThinMaterial, in: .capsule)
#else
                .glassEffect()
#endif
            CodeBlockView(.dismissHideBackButton)
        }
        .navigationBarBackButtonHidden(hideBackButton)
    }
}

#Preview {
    TopicDismiss()
        .darkSchemePreferred()
}
