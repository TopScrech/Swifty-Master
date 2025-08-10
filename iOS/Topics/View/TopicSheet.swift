import SwiftUI

struct TopicSheet: View {
    @State private var sheetExample = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("A sheet presents a modal view over the current screen, often used for settings or secondary content")
            
            TopicActionButton("Present a sheet", color: .blue.opacity(0.3)) {
                sheetExample = true
            }
            
            CodeBlockView(.sheet)
            
            TopicDisclosureGroup("Dismiss a sheet (before iOS 15)") {
                Text("To dismiss a sheet before ios 15, there is a change to make only in the sheet content")
                
                CodeBlockView(.sheetBefore15)
            }
        }
        .sheet($sheetExample) {
            ExampleSheet()
                .presentationDetents([.height(320)])
        }
    }
}

#Preview {
    TopicSheet()
}
