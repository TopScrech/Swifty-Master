import SwiftUI

struct TopicPopover: View {
    @State private var popoverExample = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("A popover displays a small, dismissible view anchored to another view, commonly used for contextual information or actions")
            
            TopicActionButton("Present a popover", color: .blue.opacity(0.3)) {
                popoverExample = true
            }
            
            CodeBlockView(.popover)
        }
        .popover($popoverExample) {
            ExampleSheet()
                .presentationDetents([.height(320)])
        }
    }
}

#Preview {
    TopicPopover()
}
