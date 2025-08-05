import Foundation

enum CodeBlock: String {
    
    // Content
    case mdRegular, mdBoldItalic, mdStrikethrough, mdMonospaced, mdLink,
         textLineLimit,
         image,
         textField, textFieldDisableAutocorrection,
         textEditor, textEditorFormat,
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
         gauges,
         progressView,
         badges,
         
         // View
         sheet, sheetBefore15,
         emptyView, emptyViewAnyView,
         popover,
         alert,
         appStoreOverlay,
         
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
         list,
         scrollView,
         grid,
         lazyVGrid,
         lazyHGrid,
         tabView,
         
         // Layout
         spacer,
         divider,
         padding,
         frame,
         geometryReader,
         equalSizeViews,
         
         // Design
         color,
         gradient,
         
         // System
         darkMode,
         detectOSVersion, detectOSVersionNewAndOld,
         lowPowerMode,
         detectLanguage,
         detectDeviceUsed,
         differentiateOS,
         detectScreenSize,
         detectCompactOrRegular
    
    var code: String {
        guard let url = Bundle.main.url(forResource: self.rawValue, withExtension: "txt") else {
            return ""
        }
        
        return try! String(contentsOf: url, encoding: .utf8)
    }
}
