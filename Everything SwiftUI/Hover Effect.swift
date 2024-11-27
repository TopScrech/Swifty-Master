import SwiftUI

struct HoverEffect: View {
    var body: some View {
        Text("Highlight")
            .hoverEffect(.highlight)
        
        Text("Lift")
            .hoverEffect(.lift)
    }
}

#Preview {
    HoverEffect()
}
