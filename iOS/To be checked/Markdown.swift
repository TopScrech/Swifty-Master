import SwiftUI

struct Markdown: View {
    var body: some View {
        List {
            Section {
                VStack {
                    Text("This is regular text")
                    
                    SimpleCodeBlockView(.mdRegular)
                }
            }
            
            Section {
                VStack {
                    Text("This is **bold** text, this is *italic* text, and this is ***bold, italic*** text")
                    
                    SimpleCodeBlockView(.mdBoldItalic)
                }
            }
            
            Section {
                VStack {
                    Text("~~A strikethrough example~~")
                    
                    SimpleCodeBlockView(.mdStrikethrough)
                }
            }
            
            Section {
                VStack {
                    Text("`Monospaced works too`")
                    
                    SimpleCodeBlockView(.mdMonospaced)
                }
            }
            
            Section {
                VStack {
                    Text("Link: [click](https://topscrech.dev)")
                        .tint(.indigo)
                    
                    SimpleCodeBlockView(.mdLink)
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
