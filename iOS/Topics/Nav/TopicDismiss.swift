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
            TopicDocs(Topic.dismiss.docs)
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(hideBackButton)
    }
}

func highlightOccurrences(
    in text: String,
    target: String,
    color: Color
) -> AttributedString {
    
    var attributed = AttributedString(text)
    
    guard !target.isEmpty else {
        return attributed
    }
    
    var currentIndex = attributed.startIndex
    
    while currentIndex < attributed.endIndex,
          let range = attributed[currentIndex...].range(of: target) {
        attributed[range].foregroundColor = color
        attributed[range].font = .body.weight(.bold).monospaced()
        currentIndex = range.upperBound
    }
    
    return attributed
}

#Preview {
    TopicDismiss()
        .darkSchemePreferred()
}
