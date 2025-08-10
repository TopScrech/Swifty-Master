import SwiftUI

struct ExampleSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        TopicActionButton("Dismiss", color: .red.opacity(0.3)) {
            dismiss()
        }
        .scenePadding()
    }
}

#Preview {
    ExampleSheet()
}
