import SwiftUI

struct MaterialsView: View {
    private let materials: [(String, Material)] = [
        ("Ultra Thick", .ultraThick),
        ("Thick", .thick),
        ("Regular", .regular),
        ("Thin", .thin),
        ("Ultra Thin", .ultraThin),
        ("Bar", .bar)
    ]
    
    var body: some View {
        TabView {
            ForEach(0..<materials.count, id: \.self) { index in
                let (key, value) = materials[index]
                
                ZStack {
                    Image(.vodka)
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    
                    Rectangle()
                        .fill(value)
                        .ignoresSafeArea()
                    
                    ZStack {
                        Text(key)
                            .rounded()
                            .title3(.semibold)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(.ultraThinMaterial, in: .capsule)
                    }
                }
            }
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    MaterialsView()
}
