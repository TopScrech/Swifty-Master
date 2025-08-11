import SwiftUI

struct Markdown: View {
    var body: some View {
        VStack(spacing: 25) {
            VStack {
                Text("Regular text")
                
                CodeBlockView(.mdRegular)
            }
            
            VStack {
                Text("**Bold**, ***bold italic***")
                
                CodeBlockView(.mdBoldItalic)
            }
            
            VStack {
                Text("~~Strikethrough~~")
                
                CodeBlockView(.mdStrikethrough)
            }
            
            VStack {
                Text("`Monospaced`")
                
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
