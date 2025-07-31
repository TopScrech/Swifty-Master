import SwiftUI

struct TopicSheet: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Sheet")
            
            CodeBlockView(.sheet)
            
            TopicDisclosureGroup("Dismiss a sheet (before iOS 15)") {
                Text("To dismiss a sheet before ios 15, there is a change to make only in the sheet content")
                
                CodeBlockView(.sheetBefore15)
            }
        }
    }
}

#Preview {
    TopicSheet()
}
