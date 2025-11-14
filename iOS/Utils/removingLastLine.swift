import Foundation

extension String {
    var removingLastLine: String {
        var lines = self.components(separatedBy: .newlines)
        
        if !lines.isEmpty {
            lines.removeLast()
        }
        
        return lines.joined(separator: "\n")
    }
}
