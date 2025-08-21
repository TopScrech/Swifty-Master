import SwiftUI

struct TopicNavigationView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("A container that enables navigation between views using a navigation bar (deprecated in iOS 16 in favor of NavigationStack)")
            
            CodeBlockView(.navigationView)
        }
    }
}

#Preview {
    TopicNavigationView()
}
