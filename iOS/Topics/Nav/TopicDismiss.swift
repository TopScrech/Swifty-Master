import SwiftUI

struct TopicDismiss: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var hideBackButton = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("You can programmatically dismiss any view or sheet using the `dismiss()` environment method")
            
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
                    .frame(maxWidth: .infinity)
                    .semibold()
                    .padding(.vertical, 10)
            }
            .buttonStyle(.glassProminent)
            .tint(.red.opacity(0.2))
            
            SimpleCodeBlockView("""
struct ContentView: View {
    @Environment(\\.dismiss) private var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}
""")
            TopicHeading("Hide native back button")
            
            Text("Don't worry, you can also disable the native dismiss button by using the view modifier called `.navigationBarBackButtonHidden()`")
            
            Toggle("Hide native back button", isOn: $hideBackButton)
                .padding()
#if os(visionOS)
                .background(.ultraThinMaterial, in: .capsule)
#else
                .glassEffect()
#endif
            SimpleCodeBlockView("""
struct ContentView: View {
    @State private var hideBackButton = false
    
    var body: some View {
        SomeView {...}
            .navigationBarBackButtonHidden()
            // or
            .navigationBarBackButtonHidden(hideBackButton)
    }
}
""")
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(hideBackButton)
    }
}

#Preview {
    TopicDismiss()
        .darkSchemePreferred()
}
