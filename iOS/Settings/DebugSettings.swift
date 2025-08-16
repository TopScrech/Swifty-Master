import SwiftUI

struct DebugSettings: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        DisclosureGroup("Debug") {
            Button("Reset nav mode") {
                store.navMode = nil
            }
            
            Toggle("Status bar", isOn: $store.showStatusBar)
            
            Button("Alt icon") {
                UIApplication.shared.setAlternateIconName("Liquid Glass")
            }
            
            Button("Rest icon") {
                UIApplication.shared.setAlternateIconName(nil)
            }
            
            Button {
                store.favoriteTopics = Topic.allCases
            } label: {
                HStack {
                    Text("Add all to favorites")
                    
                    Spacer()
                    
                    Image(systemName: "star")
                        .title3()
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
                        .title3()
                        .foregroundStyle(.red)
                }
            }
            .disabled(store.favoriteTopics.isEmpty)
            
            NavigationLink("All code blocks") {
                ScrollView {
                    LazyVStack {
                        ForEach(CodeBlock.allCases) { block in
                            CodeBlockView(block)
                        }
                    }
                }
                .scrollIndicators(.never)
                .scenePadding()
                .navigationTitle("All code blocks")
                .navSubtitle(CodeBlock.allCases.count)
                .toolbarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    DebugSettings()
        .darkSchemePreferred()
        .environmentObject(ValueStore())
}
