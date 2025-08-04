import SwiftUI

struct Markdown: View {
    var body: some View {
        VStack(spacing: 25) {
            VStack {
                Text("This is regular text")
                
                CodeBlockView(.mdRegular)
            }
            
            VStack {
                Text("This is **bold** text, this is *italic* text, and this is ***bold, italic*** text")
                
                CodeBlockView(.mdBoldItalic)
            }
            
            VStack {
                Text("~~A strikethrough example~~")
                
                CodeBlockView(.mdStrikethrough)
            }
            
            VStack {
                Text("`Monospaced works too`")
                
                CodeBlockView(.mdMonospaced)
            }
            
            VStack {
                Text("Link: [click](https://topscrech.dev)")
                    .tint(.indigo)
                
                CodeBlockView(.mdLink)
                    .multilineTextAlignment(.leading)
            }
        }
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    NavigationView {
        Markdown()
    }
    .darkSchemePreferred()
}
