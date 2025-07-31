import SwiftUI

struct Markdown: View {
    var body: some View {
        List {
            Section {
                VStack {
                    Text("This is regular text")
                    
                    CodeBlockView(.mdRegular)
                }
            }
            
            Section {
                VStack {
                    Text("This is **bold** text, this is *italic* text, and this is ***bold, italic*** text")
                    
                    CodeBlockView(.mdBoldItalic)
                }
            }
            
            Section {
                VStack {
                    Text("~~A strikethrough example~~")
                    
                    CodeBlockView(.mdStrikethrough)
                }
            }
            
            Section {
                VStack {
                    Text("`Monospaced works too`")
                    
                    CodeBlockView(.mdMonospaced)
                }
            }
            
            Section {
                VStack {
                    Text("Link: [click](https://topscrech.dev)")
                        .tint(.indigo)
                    
                    CodeBlockView(.mdLink)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .multilineTextAlignment(.center)
        .navigationTitle("Markdown")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        Markdown()
    }
    .darkSchemePreferred()
}
