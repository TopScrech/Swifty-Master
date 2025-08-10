import SwiftUI

struct DebugSettings: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
#if DEBUG
        Section("Debug") {
            Toggle("Show status bar", isOn: $store.showStatusBar)
            
            Button {
                store.favoriteTopics = Topic.allCases
            } label: {
                HStack {
                    Text("Add all to favorites")
                    
                    Spacer()
                    
                    Image(systemName: "star")
                        .foregroundStyle(.yellow)
                }
            }
            
            Button(role: .destructive) {
                store.favoriteTopics = []
            } label: {
                HStack {
                    Text("Remove all favorites")
                    
                    Spacer()
                    
                    Image(systemName: "star.slash")
                        .secondary()
                }
            }
            
            NavigationLink("All code blocks") {
                ScrollView {
                    LazyVStack {
                        ForEach(CodeBlock.allCases) { block in
                            CodeBlockView(block)
                        }
                    }
                }
                .scrollIndicators(.never)
            }
        }
#endif
    }
}

#Preview {
    DebugSettings()
        .darkSchemePreferred()
        .environmentObject(ValueStore())
}
