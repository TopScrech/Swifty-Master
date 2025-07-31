import SwiftUI

struct TopicTextEditor: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI's `TextEditor` allows users to enter or edit multi-line text. It supports rich formatting and large content inputs")
            
            TextEditor(text: $text)
            
            CodeBlockView(.textEditor)
        }
    }
}

#Preview {
    TopicTextEditor()
}
