import ScrechKit
import SwiftParser
import SwiftSyntax

func attributedCodeString(for code: String) -> AttributedString {
    AttributedString.highlight(code: code)
}

extension AttributedString {
    static func highlight(code: String) -> AttributedString {
        var highlightedString = AttributedString(code)

        guard !code.isEmpty else {
            return highlightedString
        }

        let sourceFile = Parser.parse(source: code)
        let tokens = Array(sourceFile.tokens(viewMode: .sourceAccurate))
        let parameterLabelIndices = callParameterLabelIndices(in: tokens)

        for (index, token) in tokens.enumerated() {
            if let color = color(for: token.tokenKind) {
                let lowerBound = token.positionAfterSkippingLeadingTrivia.utf8Offset
                let upperBound = token.endPositionBeforeTrailingTrivia.utf8Offset
                apply(color: color, to: lowerBound..<upperBound, in: code, highlightedString: &highlightedString)
            }

            if shouldColorAsModifier(tokens: tokens, at: index) {
                apply(color: modifierColor, to: token, in: code, highlightedString: &highlightedString)
            }

            if parameterLabelIndices.contains(index) {
                apply(color: modifierParameterColor, to: token, in: code, highlightedString: &highlightedString)
            }

            if shouldColorAsBinding(tokens: tokens, at: index) {
                apply(color: bindingColor, to: token, in: code, highlightedString: &highlightedString)
            }

            var triviaOffset = token.position.utf8Offset
            for piece in token.leadingTrivia {
                let nextOffset = triviaOffset + piece.sourceLength.utf8Length
                if piece.isComment {
                    apply(color: commentColor, to: triviaOffset..<nextOffset, in: code, highlightedString: &highlightedString)
                }
                triviaOffset = nextOffset
            }

            triviaOffset = token.endPositionBeforeTrailingTrivia.utf8Offset
            for piece in token.trailingTrivia {
                let nextOffset = triviaOffset + piece.sourceLength.utf8Length
                if piece.isComment {
                    apply(color: commentColor, to: triviaOffset..<nextOffset, in: code, highlightedString: &highlightedString)
                }
                triviaOffset = nextOffset
            }
        }

        return highlightedString
    }

    private static func color(for tokenKind: TokenKind) -> Color? {
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
                case .leftParen:
                    depth += 1
                case .rightParen:
                    depth -= 1
                default:
                    break
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

    private static func apply(
        color: Color,
        to token: TokenSyntax,
        in code: String,
        highlightedString: inout AttributedString
    ) {
        let lowerBound = token.positionAfterSkippingLeadingTrivia.utf8Offset
        let upperBound = token.endPositionBeforeTrailingTrivia.utf8Offset
        apply(color: color, to: lowerBound..<upperBound, in: code, highlightedString: &highlightedString)
    }

    private static func apply(
        color: Color,
        to utf8Range: Range<Int>,
        in code: String,
        highlightedString: inout AttributedString
    ) {
        guard
            let startIndex = stringIndex(for: utf8Range.lowerBound, in: code),
            let endIndex = stringIndex(for: utf8Range.upperBound, in: code),
            startIndex <= endIndex,
            let attributedRange = Range(startIndex..<endIndex, in: highlightedString)
        else {
            return
        }

        highlightedString[attributedRange].foregroundColor = color
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

    private static let keywordColor = Color(0xFC5FA3)
    private static let directiveColor = Color(0xFD8F3F)
    private static let numberColor = Color(0xD0BF69)
    private static let stringColor = Color(0xFC6A5D)
    private static let commentColor = Color(0x6C7986)
    private static let attributeColor = Color(0xA167E6)
    private static let bindingColor = Color(0x67B7A4)
    private static let modifierColor = Color(0xA167E6)
    private static let modifierParameterColor = Color(0xA167E6)
    private static let typeColor = Color(0xD0A8FF)
}
