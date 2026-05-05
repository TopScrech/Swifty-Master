#if canImport(UIKit) && !os(tvOS)
import SwiftUI
import UIKit

struct CodeBlockLineNumbersTextView: UIViewRepresentable {
    let lineCount: Int
    let width: CGFloat
    let color: Color
    let lineSpacing: CGFloat
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.adjustsFontForContentSizeCategory = true
        textView.textAlignment = .right
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        textView.attributedText = attributedText
        textView.textAlignment = .right
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UITextView, context: Context) -> CGSize? {
        CGSize(width: width, height: textSize.height)
    }
    
    private var attributedText: NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let fullRange = NSRange(location: 0, length: attributedString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        paragraphStyle.lineSpacing = lineSpacing
        
        attributedString.addAttribute(.font, value: CodeBlockTextMetrics.font, range: fullRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor(color), range: fullRange)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: fullRange)
        
        return attributedString
    }
    
    private var text: String {
        (1...lineCount).map(String.init).joined(separator: "\n")
    }
    
    private var textSize: CGSize {
        let boundingSize = attributedText.boundingRect(
            with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        
        return CGSize(width: width, height: ceil(boundingSize.height))
    }
}
#endif
