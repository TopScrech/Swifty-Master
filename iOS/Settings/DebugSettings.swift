import SwiftUI

struct DebugSettings: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        List {
            Section {
                Button("Reset nav mode") {
                    store.navMode = nil
                }
                
                Toggle("Status bar", isOn: $store.showStatusBar)
            }
            
            Section {
                Button("Alt icon") {
                    UIApplication.shared.setAlternateIconName("Liquid Glass")
                }
                
                Button("Reset icon") {
                    UIApplication.shared.setAlternateIconName(nil)
                }
            }
            
            Section {
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
            }
            
            Section {
                NavigationLink("All code blocks") {
                    ScrollView {
                        LazyVStack {
                            ForEach(CodeBlock.allCases) { block in
                                CodeBlockView(block)
                            }
                        }
                    }
                    .navigationTitle("All code blocks")
                    .scrollIndicators(.never)
                    .scenePadding()
                    .navSubtitle(CodeBlock.allCases.count)
                    .toolbarTitleDisplayMode(.inline)
                }
            }
        }
        .navigationTitle("Debug")
        .foregroundStyle(.foreground)
    }
}

#Preview {
    NavigationStack {
        DebugSettings()
    }
    .environmentObject(ValueStore())
}
