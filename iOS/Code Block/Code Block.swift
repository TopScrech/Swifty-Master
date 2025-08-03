import Foundation

enum CodeBlock: String {
    
    // Content
    case mdRegular, mdBoldItalic, mdStrikethrough, mdMonospaced, mdLink,
         textLineLimit,
         image,
         textField, textFieldDisableAutocorrection,
         textEditor,
         label,
         sfSymbols,
         shape,
         customKeyboard,
         
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
         navigationView,
         navigationStack,
         navigationSplitView,
         navigationBar,
         navigationLink,
         passAView,
         link,
         
         // Collection
         vStack,
         hStack,
         zStack,
         grid,
         
         // Layout
         spacer,
         divider,
         
         // Design
         color,
         gradient,
         
         // System
         darkMode,
         detectOSVersion, detectOSVersionNewAndOld,
         lowPowerMode,
         detectLanguage
    
    var code: String {
        guard let url = Bundle.main.url(forResource: self.rawValue, withExtension: "txt") else {
            return ""
        }
        
        return try! String(contentsOf: url, encoding: .utf8)
    }
}
