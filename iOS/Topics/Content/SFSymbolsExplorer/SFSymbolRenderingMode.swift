import ScrechKit

enum SFSymbolRenderingMode: String, CaseIterable, Identifiable {
    case monochrome, hierarchical, palette, multicolor
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case .monochrome: "Monochrome"
        case .hierarchical: "Hierarchical"
        case .palette: "Palette"
        case .multicolor: "Multicolor"
        }
    }
    
    var systemImage: String {
        switch self {
        case .monochrome: "circle"
        case .hierarchical: "circle.lefthalf.filled"
        case .palette: "paintpalette"
        case .multicolor: "circle.hexagongrid.fill"
        }
    }
    
    var symbolRenderingMode: SymbolRenderingMode {
        switch self {
        case .monochrome: .monochrome
        case .hierarchical: .hierarchical
        case .palette: .palette
        case .multicolor: .multicolor
        }
    }
}
