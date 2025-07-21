import SwiftUI

struct TextFontSize: Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let size: Int
    let font: Font
    
    init(_ name: String, size: Int, font: Font) {
        self.name = name
        self.size = size
        self.font = font
    }
}

struct TextFontWeight: Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let weight: Font.Weight
    
    init(_ name: String, weight: Font.Weight) {
        self.name = name
        self.weight = weight
    }
}

struct TextFontDesign: Identifiable {
    var id: String {
        name
    }
    
    let name: String
    let design: Font.Design
    
    init(_ name: String, design: Font.Design) {
        self.name = name
        self.design = design
    }
}
