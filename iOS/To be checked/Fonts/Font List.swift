import ScrechKit

struct FontList: View {    
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
        .navigationTitle("Fonts")
        .toolbarTitleDisplayMode(.inline)
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
