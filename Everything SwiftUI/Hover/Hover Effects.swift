import SwiftUI

struct HoverEffects: View {
    var body: some View {
        Text("Highlight")
            .hoverEffect(.highlight)
        
        Text("Lift")
            .hoverEffect(.lift)
    }
}

#Preview {
    HoverEffects()
}
