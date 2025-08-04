import SwiftUI

struct MaterialsView: View {
    private let materials: [(String, Material?)] = [
        ("None", nil),
        ("Ultra Thin", .ultraThin),
        ("Thin", .thin),
        ("Regular", .regular),
        ("Thick", .thick),
        ("Ultra Thick", .ultraThick),
        ("Bar", .bar)
    ]
    
    var body: some View {
        VStack {
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
                .frame(300)
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
