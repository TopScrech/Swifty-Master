import SwiftUI

struct FontWeightItem: View {
    private let font: TextFontWeight
    
    init(_ font: TextFontWeight) {
        self.font = font
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(font.name)
                .fontWeight(font.weight)
            
            Spacer()
        }
    }
}
