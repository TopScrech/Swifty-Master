import SwiftUI

struct BrightnessScreenReaderView: UIViewRepresentable {
    let onScreenChange: @MainActor (UIScreen?) -> Void
    
    func makeUIView(context: Context) -> BrightnessScreenReaderUIView {
        let view = BrightnessScreenReaderUIView()
        view.isUserInteractionEnabled = false
        view.onScreenChange = onScreenChange
        
        return view
    }
    
    func updateUIView(_ view: BrightnessScreenReaderUIView, context: Context) {
        view.onScreenChange = onScreenChange
        view.reportCurrentScreen()
    }
}
