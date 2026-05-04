import ScrechKit

struct DebugSettingsAllCodeBlocks: View {
    var body: some View {
        Section {
            NavigationLink {
                ScrollView {
                    LazyVStack {
                        ForEach(CodeBlock.allCases) {
                            CodeBlockView($0)
                        }
                    }
                    .scenePadding()
                }
                .navigationTitle("All code blocks")
                .scrollIndicators(.never)
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
    .darkSchemePreferred()
}
