import ScrechKit

struct TextStyle: Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let size: Int
    let font: Font
    
    init(_ name: String, size: Int, font: Font) {
        self.name = name
        self.size = size
        self.font = font
    }
}

struct TopicText: View {
    @State private var isBold = false
    
    private let styles: [TextStyle] = [
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
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Text is a SwiftUI element used to display static or dynamic strings in the interface. It supports rich formatting, localization, and adapts to system-wide accessibility settings")
            
            TopicDisclosureGroup("Font Size") {
                ForEach(styles) { text in
                    FontItem(text)
                }
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

struct FontItem: View {
    private let font: TextStyle
    
    init(_ font: TextStyle) {
        self.font = font
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("\(font.size)pt")
                .secondary()
                .monospacedDigit()
            
            Text(font.name)
                .font(font.font)
            
            Spacer()
        }
    }
}

#Preview {
    TopicText()
}
