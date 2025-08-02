import SwiftUI

struct FontSizeItem: View {
    private let text: TextFontSize
    
    init(_ text: TextFontSize) {
        self.text = text
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("\(text.size)pt")
                .footnote()
                .secondary()
                .monospacedDigit()
            
            Text(text.name)
                .font(text.font)
            
            Spacer()
        }
    }
}
