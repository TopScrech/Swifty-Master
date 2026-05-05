#if canImport(UIKit) && !os(tvOS)
import SwiftUI
import SwiftParser
import SwiftSyntax

struct SelectableCodeTextView: UIViewRepresentable {
    let code: String
    let textColor: Color
    let lineSpacing: CGFloat
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = true
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.adjustsFontForContentSizeCategory = true
        textView.setContentCompressionResistancePriority(.required, for: .horizontal)
        textView.setContentHuggingPriority(.required, for: .horizontal)
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        textView.attributedText = attributedText
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UITextView, context: Context) -> CGSize? {
        textSize
    }
    
    private var attributedText: NSAttributedString {
        let attributedString = NSMutableAttributedString(string: code)
        let fullRange = NSRange(location: 0, length: attributedString.length)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        attributedString.addAttribute(.font, value: CodeBlockTextMetrics.font, range: fullRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor(textColor), range: fullRange)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: fullRange)
        attributedString.applySyntaxHighlighting(to: code)
        
        return attributedString
    }
    
    private var textSize: CGSize {
        let boundingSize = attributedText.boundingRect(
            with: CGSize(width: 10_000, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        
        return CGSize(width: ceil(boundingSize.width), height: ceil(boundingSize.height))
    }
    
}

private extension NSMutableAttributedString {
    func applySyntaxHighlighting(to code: String) {
        guard !code.isEmpty else {
            return
        }
        
        let sourceFile = Parser.parse(source: code)
        let tokens = Array(sourceFile.tokens(viewMode: .sourceAccurate))
        let parameterLabelIndices = Self.callParameterLabelIndices(in: tokens)
        
        for (index, token) in tokens.enumerated() {
            if let color = Self.color(for: token.tokenKind) {
                apply(color: color, to: token, in: code)
            }
            
            if Self.shouldColorAsModifier(tokens: tokens, at: index) {
                apply(color: Self.modifierColor, to: token, in: code)
            }
            
            if parameterLabelIndices.contains(index) {
                apply(color: Self.modifierParameterColor, to: token, in: code)
            }
            
            if Self.shouldColorAsAttributeIdentifier(tokens: tokens, at: index) {
                apply(color: Self.attributeColor, to: token, in: code)
            }
            
            if Self.shouldColorAsBinding(tokens: tokens, at: index) {
                apply(color: Self.bindingColor, to: token, in: code)
            }
            
            applyCommentColors(for: token, in: code)
        }
        
        colorBindings(in: code)
    }
    
    private func applyCommentColors(for token: TokenSyntax, in code: String) {
        var triviaOffset = token.position.utf8Offset
        
        for piece in token.leadingTrivia {
            let nextOffset = triviaOffset + piece.sourceLength.utf8Length
            
            if piece.isComment {
                apply(color: Self.commentColor, to: triviaOffset..<nextOffset, in: code)
            }
            
            triviaOffset = nextOffset
        }
        
        triviaOffset = token.endPositionBeforeTrailingTrivia.utf8Offset
        
        for piece in token.trailingTrivia {
            let nextOffset = triviaOffset + piece.sourceLength.utf8Length
            
            if piece.isComment {
                apply(color: Self.commentColor, to: triviaOffset..<nextOffset, in: code)
            }
            
            triviaOffset = nextOffset
        }
    }
    
    private static func color(for tokenKind: TokenKind) -> UIColor? {
        switch tokenKind {
        case .keyword:
            keywordColor
            
        case .poundIf, .poundElse, .poundElseif, .poundEndif, .poundAvailable, .poundUnavailable, .poundSourceLocation:
            directiveColor
            
        case .integerLiteral, .floatLiteral:
            numberColor
            
        case .stringQuote, .multilineStringQuote, .stringSegment, .rawStringPoundDelimiter, .regexLiteralPattern, .regexPoundDelimiter, .regexSlash:
            stringColor
            
        case .dollarIdentifier:
            bindingColor
            
        case .atSign:
            attributeColor
            
        case .identifier(let identifier) where identifier.first?.isUppercase == true:
            typeColor
            
        default:
            nil
        }
    }
    
    private static func shouldColorAsModifier(tokens: [TokenSyntax], at index: Int) -> Bool {
        guard
            index > 0,
            case .identifier = tokens[index].tokenKind,
            case .period = tokens[index - 1].tokenKind
        else {
            return false
        }
        
        let hasCallParenthesis: Bool = if index + 1 < tokens.count {
            if case .leftParen = tokens[index + 1].tokenKind {
                true
            } else {
                false
            }
        } else {
            false
        }
        
        let hasLeadingDotContext: Bool = if index >= 2 {
            switch tokens[index - 2].tokenKind {
            case .leftParen, .leftSquare, .leftBrace, .comma, .colon, .equal:
                true
                
            default:
                false
            }
        } else {
            true
        }
        
        return hasCallParenthesis || hasLeadingDotContext
    }
    
    private static func callParameterLabelIndices(in tokens: [TokenSyntax]) -> Set<Int> {
        var result: Set<Int> = []
        var index = 0
        
        while index < tokens.count {
            guard isCallOpeningParen(tokens: tokens, at: index) else {
                index += 1
                continue
            }
            
            var depth = 1
            var scanIndex = index + 1
            
            while scanIndex < tokens.count, depth > 0 {
                switch tokens[scanIndex].tokenKind {
                case .leftParen: depth += 1
                case .rightParen: depth -= 1
                default: break
                }
                
                if depth == 1,
                   case .identifier = tokens[scanIndex].tokenKind,
                   scanIndex + 1 < tokens.count,
                   case .colon = tokens[scanIndex + 1].tokenKind {
                    result.insert(scanIndex)
                }
                
                scanIndex += 1
            }
            
            index = max(scanIndex, index + 1)
        }
        
        return result
    }
    
    private static func isCallOpeningParen(tokens: [TokenSyntax], at index: Int) -> Bool {
        guard
            index > 0,
            case .leftParen = tokens[index].tokenKind
        else {
            return false
        }
        
        switch tokens[index - 1].tokenKind {
        case .identifier, .rightParen, .rightSquare, .rightBrace, .rightAngle:
            return true
            
        default:
            return false
        }
    }
    
    private static func shouldColorAsBinding(tokens: [TokenSyntax], at index: Int) -> Bool {
        guard index > 0 else {
            return false
        }
        
        if case .identifier = tokens[index].tokenKind,
           case .prefixOperator(let value) = tokens[index - 1].tokenKind,
           value == "$" {
            return true
        }
        
        if case .prefixOperator(let value) = tokens[index].tokenKind,
           value == "$",
           index + 1 < tokens.count,
           case .identifier = tokens[index + 1].tokenKind {
            return true
        }
        
        return false
    }
    
    private static func shouldColorAsAttributeIdentifier(tokens: [TokenSyntax], at index: Int) -> Bool {
        guard
            case .identifier = tokens[index].tokenKind,
            index > 0,
            case .atSign = tokens[index - 1].tokenKind
        else {
            return false
        }
        
        return true
    }
    
    private func colorBindings(in code: String) {
        guard let regex = try? NSRegularExpression(pattern: #"\$[A-Za-z_]\w*|\$\d+"#) else {
            return
        }
        
        let fullRange = NSRange(code.startIndex..., in: code)
        
        for match in regex.matches(in: code, range: fullRange) {
            addAttribute(.foregroundColor, value: Self.bindingColor, range: match.range)
        }
    }
    
    private func apply(color: UIColor, to token: TokenSyntax, in code: String) {
        let lowerBound = token.positionAfterSkippingLeadingTrivia.utf8Offset
        let upperBound = token.endPositionBeforeTrailingTrivia.utf8Offset
        apply(color: color, to: lowerBound..<upperBound, in: code)
    }
    
    private func apply(color: UIColor, to utf8Range: Range<Int>, in code: String) {
        guard
            let startIndex = Self.stringIndex(for: utf8Range.lowerBound, in: code),
            let endIndex = Self.stringIndex(for: utf8Range.upperBound, in: code),
            startIndex <= endIndex
        else {
            return
        }
        
        addAttribute(.foregroundColor, value: color, range: NSRange(startIndex..<endIndex, in: code))
    }
    
    private static func stringIndex(for utf8Offset: Int, in code: String) -> String.Index? {
        guard
            utf8Offset >= 0,
            let utf8Index = code.utf8.index(code.utf8.startIndex, offsetBy: utf8Offset, limitedBy: code.utf8.endIndex)
        else {
            return nil
        }
        
        return String.Index(utf8Index, within: code)
    }
    
    private static let keywordColor = UIColor(Color(0xFC5FA3))
    private static let directiveColor = UIColor(Color(0xFD8F3F))
    private static let numberColor = UIColor(Color(0xD0BF69))
    private static let stringColor = UIColor(Color(0xFC6A5D))
    private static let commentColor = UIColor(Color(0x6C7986))
    private static let attributeColor = UIColor(Color(0xA167E6))
    private static let bindingColor = UIColor(Color(0x67B7A4))
    private static let modifierColor = UIColor(Color(0xA167E6))
    private static let modifierParameterColor = UIColor(Color(0xA167E6))
    private static let typeColor = UIColor(Color(0xD0A8FF))
}
#endif
