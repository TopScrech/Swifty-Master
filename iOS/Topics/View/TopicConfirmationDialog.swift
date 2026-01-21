import ScrechKit

struct TopicConfirmationDialog: View {
    @State private var showDialog = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("A confirmation dialog presents a list of choices, typically for destructive or secondary actions")
            
            TopicActionButton("Show confirmation dialog", color: .blue.opacity(0.3)) {
                showDialog = true
            }
            
            CodeBlockView(.confirmationDialog)
        }
        .confirmationDialog("Manage item", isPresented: $showDialog, titleVisibility: .visible) {
            Button("Rename") {}
            Button("Duplicate") {}
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Choose an action")
        }
    }
}

#Preview {
    TopicConfirmationDialog()
        .darkSchemePreferred()
}
