import SwiftUI

struct MaterialsView: View {
    private let materials = [
        ("Ultra Thin", Material.ultraThin),
        ("Thin", .thin),
        ("Regular", .regular),
        ("Thick", .thick),
        ("Ultra Thick", .ultraThick),
        ("Bar", .bar),
        ("None", nil)
    ]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 32) {
            ForEach(0..<materials.count, id: \.self) { index in
                let (key, value) = materials[index]
                
                ZStack {
                    Image(.vodka)
                        .resizable()
                        .scaledToFit()
                    
                    if let value {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(value)
                        
                        ZStack {
                            Text(key)
                                .rounded()
                                .title3(.semibold)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(value, in: .capsule)
                        }
                    }
                }
                .frame(160)
            }
        }
    }
}

#Preview {
    ScrollView(showsIndicators: false) {
        MaterialsView()
    }
    .darkSchemePreferred()
}
