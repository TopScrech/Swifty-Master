import SwiftUI

struct DebugSettingsAllCodeBlocks: View {
    var body: some View {
        Section {
            NavigationLink {
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
            } label: {
                HStack {
                    Text("All code blocks")
                    
                    Spacer()
                    
                    Text(CodeBlock.allCases.count)
                        .secondary()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            DebugSettingsAllCodeBlocks()
        }
    }
}
