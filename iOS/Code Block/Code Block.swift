import Foundation

enum CodeBlock: String {
    
    // Content
    case mdRegular, mdBoldItalic, mdStrikethrough, mdMonospaced, mdLink,
         textLineLimit,
         image,
         textField, textFieldDisableAutocorrection,
         textEditor,
         
         // Control
         button, buttonCustom,
         picker,
         stepper,
         slider,
         toggle, toggleTint,
         menu,
         contextMenu,
         
         // View
         appStoreOverlay,
         emptyView, emptyViewAnyView,
         sheet, sheetBefore15,
         popover,
         alert,
         gauges,
         
         // Nav
         dismiss, dismissHideBackButton,
         
         // Collection
         
         // Layout
         spacer,
         divider,
         
         // Design
         color,
         gradient,
         
         // System
         darkMode,
         detectOSVersion, detectOSVersionNewAndOld,
         lowPowerMode
    
    var code: String {
        guard let url = Bundle.main.url(forResource: self.rawValue, withExtension: "txt") else {
            return ""
        }
        
        return try! String(contentsOf: url, encoding: .utf8)
    }
}
