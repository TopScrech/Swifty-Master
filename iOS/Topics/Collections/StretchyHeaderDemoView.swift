import ScrechKit

struct StretchyHeaderDemoView: View {
    private let headerHeight = 260.0
    private let items = Array(1...12)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                header
                content
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Stretchy Header")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var header: some View {
        Image(.pyzh)
            .resizable()
            .scaledToFill()
            .frame(height: headerHeight)
            .clipped()
            .stretchyHeader()
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Pull down to stretch the header image")
                .secondary()
            
            ForEach(items, id: \.self) { item in
                HStack {
                    Text("Row \(item)")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .secondary()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.thinMaterial, in: .rect(cornerRadius: 16))
            }
        }
        .padding()
    }
}

private extension View {
    func stretchyHeader() -> some View {
        visualEffect { effect, geometry in
            let currentHeight = geometry.size.height
            let scrollOffset = geometry.frame(in: .scrollView).minY
            let positiveOffset = max(0, scrollOffset)
            
            let newHeight = currentHeight + positiveOffset
            let scaleFactor = newHeight / currentHeight
            
            return effect.scaleEffect(x: scaleFactor, y: scaleFactor, anchor: .bottom)
        }
    }
}

#Preview {
    NavigationStack {
        StretchyHeaderDemoView()
    }
    .darkSchemePreferred()
}
