import ScrechKit

struct TopicTextField: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI's TextField is a fundamental UI component used to allow users to input or edit single-line text")
            
            TextField("Placeholder", text: $text)
#if !os(tvOS)
                .textFieldStyle(.roundedBorder)
#endif
            CodeBlockView(.textField)
            
            TopicDisclosureGroup("Secured TextField") {
                Text("Use a secure field when you want the behavior of a TextField, but you want to hide the field’s text. Typically, you use this for entering passwords and other sensitive information")
                
                CodeBlockView(.textFieldSecured)
                
                Text("""
- Displays one dot for each character someone types
- Hides the dots when someone takes a screenshot or records the screen in iOS
- Prevents anyone from cutting or copying the field’s contents
- Displays an indicator when Caps Lock is enabled
""")
            }
            
            TopicDisclosureGroup("Custom Keyboard") {
                CodeBlockView(.customKeyboard)
            }
            
            TopicDisclosureGroup("Disable Autocorrection") {
                CodeBlockView(.textFieldDisableAutocorrection)
            }
        }
    }
}

#Preview {
    TopicTextField()
        .darkSchemePreferred()
}
