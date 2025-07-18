import ScrechKit

struct CodeBlockView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    private let code: CodeBlock
    
    init(_ code: CodeBlock) {
        self.code = code
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(attributedString(for: code.code))
                .monospaced()
                .padding()
                .background {
                    if colorScheme == .light {
                        Color.black
                    }
                }
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                SFButton("xmark") {
                    dismiss()
                }
                .tint(.red)
            }
            
            ToolbarSpacer(placement: .bottomBar)
            
            ToolbarItemGroup(placement: .bottomBar) {
                ShareLink(item: code.code)
                
                SFButton("document.on.document") {
                    UIPasteboard.general.string = code.code
                }
            }
        }
    }
    
    /// Helper function to create an AttributedString with simulated syntax highlighting
    func attributedString(for code: String) -> AttributedString {
        var attributedString = AttributedString(code)
        
        // Swift keywords
        let keywords = ["let", "var", "if", "else", "struct", "func", "return"]
        
        for keyword in keywords {
            let ranges = code.ranges(of: keyword)
            
            for range in ranges {
                if let attributedRange = Range(NSRange(range, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = Color(0xFC5FA3)
                    attributedString[attributedRange].font = .body.bold()
                }
            }
        }
        
        // Swift secondary keywords
        let secondaryKeywords = ["Gauge", "GaugeCard", "Text", "VStack", "spacing", "value", "in"]
        
        for keyword in secondaryKeywords {
            let ranges = code.ranges(of: keyword)
            
            for range in ranges {
                if let attributedRange = Range(NSRange(range, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = Color(0xD0A8FF)
                    attributedString[attributedRange].font = .body.bold()
                }
            }
        }
        
        // Modifiers
        let modifiers = ["gaugeStyle", "tint", "green", "opacity", "brown", "red", "accessoryCircular", "accessoryCircularCapacity", "accessoryLinear", "accessoryLinearCapacity", "linearCapacity", "padding", "horizontal"]
        
        for keyword in modifiers {
            let ranges = code.ranges(of: keyword)
            
            for range in ranges {
                if let attributedRange = Range(NSRange(range, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = Color(0xA167E6)
                    attributedString[attributedRange].font = .body.bold()
                }
            }
        }
        
        let quotedStringPattern = #""([^"]*?)""#
        
        if let regex = try? NSRegularExpression(pattern: quotedStringPattern) {
            let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
            
            for match in matches {
                guard match.numberOfRanges >= 1 else {
                    continue
                }
                
                let fullRange = match.range(at: 0) // Includes the quotes
                
                if let stringRange = Range(fullRange, in: code),
                   let attributedRange = Range(NSRange(stringRange, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = Color(0xFC6A5D)
                }
            }
        }
        
        // Interpolation propName
        let interpolationPattern = #"\\\(([^)]+?)\)"#
        
        if let regex = try? NSRegularExpression(pattern: interpolationPattern) {
            let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
            
            for match in matches {
                guard match.numberOfRanges >= 2 else {
                    continue
                }
                
                let innerRange = match.range(at: 1)
                
                if let stringRange = Range(innerRange, in: code),
                   let attributedRange = Range(NSRange(stringRange, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = Color(0xA167E6)
                }
            }
        }
        
        let numberPattern = #"(?<!\w)(?:\d+\.\d+|\d+)(?!\w)"#
        
        if let regex = try? NSRegularExpression(pattern: numberPattern) {
            let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
            
            for match in matches {
                let range = match.range(at: 0)
                
                if let stringRange = Range(range, in: code),
                   let attributedRange = Range(NSRange(stringRange, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = Color(0xD0BF69)
                }
            }
        }
        
        return attributedString
    }
}

extension String {
    /// Helper to find all ranges of a substring within a string
    func ranges(of substring: String) -> [Range<String.Index>] {
        var result: [Range<String.Index>] = []
        var startIndex = self.startIndex
        
        while
            startIndex < self.endIndex,
            let range = self.range(of: substring, range: startIndex..<self.endIndex)
        {
            result.append(range)
            startIndex = range.upperBound
        }
        
        return result
    }
}

#Preview {
    CodeBlockView(.gauges)
        .darkSchemePreferred()
}

//#Preview {
//    let code = """
//struct Person {
//    let name: String
//    var age: Int
//
//    func greet() {
//        print("Hello, \\(name)!")
//    }
//}
//"""
//
//    CodeBlockView(code)
//        .darkSchemePreferred()
//}
