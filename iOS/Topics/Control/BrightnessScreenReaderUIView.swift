import SwiftUI

final class BrightnessScreenReaderUIView: UIView {
    var onScreenChange: (@MainActor (UIScreen?) -> Void)?
    private var currentScreenID: ObjectIdentifier?
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        reportCurrentScreen()
    }
    
    func reportCurrentScreen() {
        let screen = window?.windowScene?.screen
        let screenID = screen.map(ObjectIdentifier.init)
        
        guard screenID != currentScreenID else {
            return
        }
        
        currentScreenID = screenID
        notifyScreenChange(screen)
    }
    
    private func notifyScreenChange(_ screen: UIScreen?) {
        guard let onScreenChange else {
            return
        }
        
        Task { @MainActor in
            onScreenChange(screen)
        }
    }
}
