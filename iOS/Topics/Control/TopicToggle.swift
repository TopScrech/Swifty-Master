import SwiftUI

struct TopicToggle: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Toggle")
            
            Toggle("Toggle", isOn: $isOn)
            
            SimpleCodeBlockView("""
struct ContentView: View {
    @State private var toggleIsOn = true
    
    var body: some View {
        Toggle("Toggle", isOn: $isOn)
    }
}
""")
            TopicHeading("Style Details")
            
            DisclosureGroup {
                VStack(spacing: 25) {
                    Toggle("Purple", isOn: $isOn)
                        .tint(.purple)
                }
                .padding()
            } label: {
                Text("Style")
                    .title3(.semibold, design: .rounded)
                    .foregroundStyle(.foreground)
            }
            
            
            DisclosureGroup {
                VStack(spacing: 25) {
                    Toggle("Purple", isOn: $isOn)
                        .tint(.purple)
                    
                    SimpleCodeBlockView("""
Toggle("Purple", isOn: $toggle1)
    .tint(.purple)
""")
                }
                .padding()
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
