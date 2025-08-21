import SwiftUI

struct TopicToggle: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Toggle lets users switch a value on or off, and can be bound to a state property to update your UI automatically")
            
            Toggle("Toggle", isOn: $isOn)
                .padding()
                .glassyBackground(16)
            
            CodeBlockView(.toggle)
            
            TopicHeading("Style Details")
            
            TopicDisclosureGroup("Style") {
                VStack(spacing: 25) {
                    Toggle("Purple", isOn: $isOn)
                        .tint(.purple)
                }
            }
            
            TopicDisclosureGroup("Color") {
                VStack(spacing: 25) {
                    Toggle("Purple", isOn: $isOn)
                        .tint(.purple)
                    
                    CodeBlockView(.toggleTint)
                }
            }
        }
    }
}

#Preview {
    TopicDetail(.toggle) { relatedTopic in
        TopicTile(relatedTopic)
    }
    .environment(NavModel())
    .environment(DataModel())
    .environmentObject(ValueStore())
}
