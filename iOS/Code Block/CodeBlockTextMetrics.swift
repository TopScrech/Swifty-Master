#if canImport(UIKit) && !os(tvOS)
import UIKit

enum CodeBlockTextMetrics {
    static var font: UIFont {
        let preferredSize = UIFont.preferredFont(forTextStyle: .footnote).pointSize
        let font = UIFont.monospacedSystemFont(ofSize: preferredSize, weight: .regular)
        return UIFontMetrics(forTextStyle: .footnote).scaledFont(for: font)
    }
}
#endif
