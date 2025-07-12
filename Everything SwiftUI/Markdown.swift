import SwiftUI

struct Markdown: View {
    var body: some View {
        VStack {
            Text("This is regular text")
            
            Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text")
            
            Text("~~A strikethrough example~~")
            
            Text("`Monospaced works too`")
            
            Text("Visit Apple: [click here](https://apple.com)")
                .tint(.indigo)
        }
    }
}

#Preview {
    Markdown()
}
