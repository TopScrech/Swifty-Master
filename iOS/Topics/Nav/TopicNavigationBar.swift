import ScrechKit

struct TopicNavigationBar: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("The top bar in a navigation container that can show titles, buttons, and other controls")
            
            CodeBlockView(.navigationBar)
            
            TopicHeading("toolbarTitleMenu")
            
            Text("Use toolbarTitleMenu to add a compact menu to the navigation title")
            
            CodeBlockView(.navigationBarTitleMenu)
        }
    }
}

#Preview {
    TopicNavigationBar()
        .darkSchemePreferred()
}
