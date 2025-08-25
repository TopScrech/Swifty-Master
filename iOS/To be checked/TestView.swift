import SwiftUI
import CodeEditorView
import LanguageSupport

struct TestView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var text = CodeBlock.gauges.code
    @State private var position = CodeEditor.Position()
    @State private var messages: Set<TextLocated<Message>> = Set()
    
    var body: some View {
        CodeEditor(
            text: $text,
            position: $position,
            messages: $messages,
            language: .swift()
        )
        .disabled(true)
        .environment(\.codeEditorTheme, colorScheme == .dark ? Theme.customDark : Theme.defaultLight)
        .environment(\.codeEditorLayoutConfiguration, .init(showMinimap: false, wrapText: true))
    }
}

extension Theme {
    public static var customDark = Theme(
        colourScheme: .dark,
        fontName: "SFMono-Medium",
        fontSize: 13.0,
        textColour: OSColor(red: 0.87, green: 0.87, blue: 0.88, alpha: 1.0), //
        commentColour: OSColor(Color(0x6C7986)), // gray
        stringColour: OSColor(red: 0.94, green: 0.53, blue: 0.46, alpha: 1.0), //
        characterColour: OSColor(red: 0.84, green: 0.79, blue: 0.53, alpha: 1.0), //
        numberColour: OSColor(Color(0xD0BF69)), // yellow
        identifierColour: OSColor(Color(0xD0A8FF)),
        operatorColour: OSColor(red: 0.62, green: 0.94, blue: 0.87, alpha: 1.0), //
        keywordColour: OSColor(Color(0xFC5FA3)), // pink
        symbolColour: OSColor(red: 0.72, green: 0.72, blue: 0.73, alpha: 1.0), //
        typeColour: OSColor(red: 0.36, green: 0.85, blue: 1.0, alpha: 1.0), //
        fieldColour: OSColor(red: 0.63, green: 0.40, blue: 0.90, alpha: 1.0), //
        caseColour: OSColor(red: 0.82, green: 0.66, blue: 1.0, alpha: 1.0), //
        backgroundColour: OSColor(red: 0.16, green: 0.16, blue: 0.18, alpha: 1.0), //
        currentLineColour: OSColor(red: 0.19, green: 0.20, blue: 0.22, alpha: 1.0), //
        selectionColour: OSColor(red: 0.40, green: 0.44, blue: 0.51, alpha: 1.0), //
        cursorColour: OSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), //
        invisiblesColour: OSColor(red: 0.33, green: 0.37, blue: 0.42, alpha: 1.0) //
    )
}

#Preview {
    TestView()
}
