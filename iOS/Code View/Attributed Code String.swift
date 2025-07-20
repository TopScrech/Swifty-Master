import ScrechKit

/// Helper function to create an AttributedString with simulated syntax highlighting
func attributedCodeString(for code: String) -> AttributedString {
    var attributedString = AttributedString(code)
    
    // Primary keywords
    let keywords = [
        "let", "var",
        "if ", "else", "elseif",
        "struct", "func", "return", "import", "public", "extension", "private",
        "true", "false"
    ]
    
    colorKeywords(keywords, color: Color(0xFC5FA3))
    
    colorWholeLine(#"(?m)^#(if|else|endif).*"#, color: Color(0xFD8F3F))
    
    colorWholeLine(#"(?m)^//.*"#, color: Color(0x6C7986))
    
    // Secondary keywords
    let secondaryKeywords = [
        "Gauge", "GaugeCard", "Text", "VStack", "Button", "SomeView",
        "spacing", "value", "in",
        "@State", "@Environment"
    ]
    
    colorKeywords(secondaryKeywords, color: Color(0xD0A8FF))
    
    // Modifiers
    let modifiers = [
        "brown", "red", "indigo", "tint", "green",
        "accessoryCircular", "accessoryCircularCapacity", "accessoryLinear", "accessoryLinearCapacity", "linearCapacity",
        "gaugeStyle", "dismiss", "opacity", "padding", "horizontal",
        "navigationBarBackButtonHidden"
    ]
    
    colorKeywords(modifiers, color: Color(0xA167E6))
    
    // String
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
    
    // Interpolation \(somethin')
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
    
    // Int & Double
    let numberPattern = #"(?<!\w)(?:\d+\.\d+|\d+)(?!\w)"#
    colorBasedOnPattern(numberPattern, color: Color(0xD0BF69))
    
    return attributedString
    
    func colorBasedOnPattern(
        _ pattern: String,
        color: Color,
        range: Int = 0
    ) {
        if let regex = try? NSRegularExpression(pattern: numberPattern) {
            let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
            
            for match in matches {
                let range = match.range(at: range)
                
                if let stringRange = Range(range, in: code),
                   let attributedRange = Range(NSRange(stringRange, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = Color(0xD0BF69)
                }
            }
        }
    }
    
    func colorWholeLine(_ regex: String, color: Color) {
        if let regex = try? NSRegularExpression(pattern: regex) {
            let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
            
            for match in matches {
                let range = match.range(at: 0)
                
                if let stringRange = Range(range, in: code),
                   let attributedRange = Range(NSRange(stringRange, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = color
                }
            }
        }
    }
    
    func colorKeywords(_ keywords: [String], color: Color) {
        for keyword in keywords {
            let ranges = code.ranges(of: keyword)
            
            for range in ranges {
                if let attributedRange = Range(NSRange(range, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = color
                    attributedString[attributedRange].font = .body.bold()
                }
            }
        }
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
