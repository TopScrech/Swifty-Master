import SwiftUI

struct TopicToggle: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Toggle")
            
            Toggle("Toggle", isOn: $isOn)
            
            SimpleCodeBlockView(.toggle)
            
            TopicHeading("Style Details")
            
            DisclosureGroup {
                VStack(spacing: 25) {
                    Toggle("Purple", isOn: $isOn)
                        .tint(.purple)
                }
                .padding(5)
            } label: {
                Text("Style")
                    .title3(.semibold, design: .rounded)
                    .foregroundStyle(.foreground)
            }
            
            DisclosureGroup {
                VStack(spacing: 25) {
                    Toggle("Purple", isOn: $isOn)
                        .tint(.purple)
                    
                    SimpleCodeBlockView(.toggleTint)
                }
                .padding(5)
            } label: {
                Text("Color")
                    .title3(.semibold, design: .rounded)
                    .foregroundStyle(.foreground)
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
    .darkSchemePreferred()
}
