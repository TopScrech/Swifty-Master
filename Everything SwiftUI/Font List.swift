import ScrechKit

struct FontList: View {
    // largeTitle - 34pt
    // title - 28pt
    // title2 - 26pt
    // title3 - 22pt
    // headline - 20pt
    // callout - 18pt
    // body - 17pt
    // subheadline - 16pt
    // footnote - 14pt
    // caption - 12pt
    // caption2 - 11pt
    
    @State private var isBold = false
    
    var body: some View {
        List {
            Text("Large title")
                .largeTitle()
            
            Text("Title")
                .title()
            
            Text("Title 2")
                .title2()
            
            Text("Title 3")
                .title3()
            
            Text("Headline")
                .headline()
            
            Text("Callout")
                .callout()
            
            Text("Body")
            
            Text("Subheadline")
                .subheadline()
            
            Text("Footnote")
                .footnote()
            
            Text("Caption")
                .caption()
            
            Text("Caption 2")
                .caption2()
        }
        .bold(isBold)
        .toolbar {
            SFButton("bold") {
                isBold.toggle()
            }
        }
    }
}

#Preview {
    FontList()
}
