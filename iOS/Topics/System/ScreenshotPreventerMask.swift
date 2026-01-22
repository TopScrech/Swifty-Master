#if canImport(UIKit)
import SwiftUI
import UIKit

extension View {
    @ViewBuilder
    func screenshotPreventingMask(_ isEnabled: Bool) -> some View {
        if isEnabled {
            self.mask {
                ScreenshotPreventerMask()
                    .ignoresSafeArea()
            }
        } else {
            self
        }
    }
}

struct ScreenshotPreventerMask: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UITextField()
        view.isSecureTextEntry = true
        view.text = ""
        view.isUserInteractionEnabled = false

        setupMaskLayer(view)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    private func setupMaskLayer(_ view: UIView) {
        if let autoHideLayer = findAutoHideLayer(view) {
            autoHideLayer.backgroundColor = UIColor.white.cgColor
        } else {
            view.layer.sublayers?.last?.backgroundColor = UIColor.white.cgColor
        }
    }

    private func findAutoHideLayer(_ view: UIView) -> CALayer? {
        view.layer.sublayers?.first(where: { layer in
            layer.delegate.debugDescription.contains("UITextLayoutCanvasView")
        })
    }
}
#endif
