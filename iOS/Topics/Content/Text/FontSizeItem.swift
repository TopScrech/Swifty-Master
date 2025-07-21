import SwiftUI

struct FontSizeItem: View {
    private let font: TextFontSize
    
    init(_ font: TextFontSize) {
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
