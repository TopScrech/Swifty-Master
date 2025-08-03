import SwiftUI

func highlightOccurrences(
    in text: String,
    target: String,
    color: Color
) -> AttributedString {
    
    var attributed = AttributedString(text)
    
    guard !target.isEmpty else {
        return attributed
    }
    
    var currentIndex = attributed.startIndex
    
    while
        currentIndex < attributed.endIndex,
        let range = attributed[currentIndex...].range(of: target)
    {
        attributed[range].foregroundColor = color
        attributed[range].font = .body.bold().monospaced()
        currentIndex = range.upperBound
    }
    
    return attributed
}
