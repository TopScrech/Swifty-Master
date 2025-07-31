import SwiftUI

struct TopicTextField: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI's TextField is a fundamental UI component used to allow users to input or edit single-line text")
            
            TextField("Placeholder", text: $text)
                .textFieldStyle(.roundedBorder)
            
            CodeBlockView(.textField)
            
            TopicDisclosureGroup("Disable Autocorrection") {
                CodeBlockView(.textFieldDisableAutocorrection)
            }
        }
    }
}

#Preview {
    TopicTextField()
}
