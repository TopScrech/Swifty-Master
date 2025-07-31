import ScrechKit

struct TopicText: View {
    @State private var isBold = false
    
    private let styles: [TextFontSize] = [
        .init("largeTitle",  size: 34, font: .largeTitle),
        .init("title",       size: 28, font: .title),
        .init("title2",      size: 26, font: .title2),
        .init("title3",      size: 22, font: .title3),
        .init("headline",    size: 20, font: .headline),
        .init("callout",     size: 18, font: .callout),
        .init("body",        size: 17, font: .body),
        .init("subheadline", size: 16, font: .subheadline),
        .init("footnote",    size: 14, font: .footnote),
        .init("caption",     size: 12, font: .caption),
        .init("caption2",    size: 11, font: .caption2)
    ]
    
    private let weights: [TextFontWeight] = [
        .init("UltraLight", weight: .ultraLight),
        .init("Thin",       weight: .thin),
        .init("Light",      weight: .light),
        .init("Regular",    weight: .regular),
        .init("Medium",     weight: .medium),
        .init("Semibold",   weight: .semibold),
        .init("Bold",       weight: .bold),
        .init("Heavy",      weight: .heavy),
        .init("Black",      weight: .black)
    ]
    
    private let designs: [TextFontDesign] = [
        .init("Default",    design: .default),
        .init("Serif",      design: .serif),
        .init("Monospaced", design: .monospaced),
        .init("Rounded",    design: .rounded)
    ]
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Text is a SwiftUI element used to display static or dynamic strings in the interface. It supports rich formatting, localization, and adapts to system-wide accessibility settings")
            
            TopicDisclosureGroup("Font Size") {
                ForEach(styles) { text in
                    FontSizeItem(text)
                }
            }
            
            TopicDisclosureGroup("Font Weight") {
                ForEach(weights) { text in
                    FontWeightItem(text)
                }
            }
            
            TopicDisclosureGroup("Font Design") {
                ForEach(designs) { text in
                    FontDesignItem(text)
                }
            }
            
            TopicDisclosureGroup("Limit the number of lines") {
                Text("GoidaGoida")
                    .frame(width: 64)
                
                Text("GoidaGoida")
                    .frame(width: 64)
                    .lineLimit(1)
                
                CodeBlockView(.textLineLimit)
            }
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
    TopicText()
}
