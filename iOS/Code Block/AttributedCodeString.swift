import ScrechKit

/// Helper function to create an AttributedString with simulated syntax highlighting
func attributedCodeString(for code: String) -> AttributedString {
    var attributedString = AttributedString(code)
    
    // String
    let quotedStringPattern = #""([^"]*?)""#
    
    let primaryKeywords = [
        "let", "var",
        "if ", "else", "elseif", "@available",
        "struct", "func", "return", "import", "public", "extension", "private", "some",
        "true", "false"
    ]
    
    let secondaryKeywords = [
        "Gauge", "GaugeCard", "Text", "VStack", "Button", "List", "Toggle", "Picker", "Divider",
        "Menu", "Label", "Image", "TextField", "TextEditor", "ProgressView", "TabView", "Tab", "Task", "UIApplication", "Slider", "Stepper",
        "NavigationView", "NavigationStack", "NavigationSplitView", "ScrollView", "ToolbarItem", "ToolbarItemGroup", "NavigationLink", "ForEach",
        "Grid", "GridRow", "LazyVGrid", "LazyHGrid", "Spacer", "GeometryReader", "HStack", "Color", "Rectangle", "UIDevice", "",
        "SomeView", "EmptyView",
        "spacing", "value", "in", " View",
        "@State", "@Environment",
        "SKOverlay", "Binding", "Bool", "AppConfiguration", "appIdentifier", "position"
    ]
    
    let modifiers = [
        "brown", "red", "indigo", "tint", "green",
        "label",
        "accessoryCircular", "accessoryCircularCapacity", "accessoryLinear", "accessoryLinearCapacity", "linearCapacity",
        "gaugeStyle", "dismiss", "opacity", "padding", "horizontal",
        "navigationBarBackButtonHidden", "appStoreOverlay"
    ]
    
    // Int & Double
    let numberPattern = #"(?<!\w)(?:\d+\.\d+|\d+)(?!\w)"#
    colorBasedOnPattern(numberPattern, color: Color(0xD0BF69))
    
    colorKeywords(primaryKeywords, color: Color(0xFC5FA3))
    
    colorWholeLine(#"(?m)^#(if|else|endif).*"#, color: Color(0xFD8F3F))
    
    // Secondary keywords
    colorKeywords(secondaryKeywords, color: Color(0xD0A8FF))
    
    // Modifiers
    colorKeywords(modifiers, color: Color(0xA167E6))
    
    // Comments
    colorWholeLine(#"(?m)^\s*//.*"#, color: Color(0x6C7986))
    
    // String
    if let regex = try? NSRegularExpression(pattern: quotedStringPattern) {
        let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
        
        for match in matches {
            guard match.numberOfRanges >= 1 else {
                continue
            }
            
            // Includes the quotes
            let fullRange = match.range(at: 0)
            
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
    
    // View Modifiers
    let modifierPattern = #"(?:\s*,\s*|\s+)\.(\w+)\s*\("#
    
    if let regex = try? NSRegularExpression(pattern: modifierPattern) {
        let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
        
        for match in matches {
            guard match.numberOfRanges >= 2 else {
                continue
            }
            
            let nameRange = match.range(at: 1)
            
            if let stringRange = Range(nameRange, in: code),
               let attributedRange = Range(NSRange(stringRange, in: code), in: attributedString) {
                attributedString[attributedRange].foregroundColor = Color(0xD0A8FF)
            }
        }
    }
    
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
