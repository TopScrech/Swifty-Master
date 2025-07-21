import SwiftUI

struct FontDesignItem: View {
    private let text: TextFontDesign
    
    init(_ text: TextFontDesign) {
        self.text = text
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(text.name)
                .fontDesign(text.design)
            
            Spacer()
        }
    }
}
