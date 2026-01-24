import ScrechKit
#if canImport(UIKit)
import UIKit
#endif

struct TopicSettingsAlternativeIcons: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Let users switch your app icon from a settings screen. Add alternate icons to your asset catalog and list them in Info.plist under CFBundleAlternateIcons")
            
#if os(iOS)
            if UIApplication.shared.supportsAlternateIcons {
                VStack(spacing: 12) {
                    TopicActionButton("Glassy icon", color: .blue.opacity(0.2)) {
                        setIcon("Liquid Glass")
                    }
                    
                    TopicActionButton("Reset icon", color: .gray.opacity(0.2)) {
                        setIcon(nil)
                    }
                }
            } else {
                TopicWarning("Alternate icons are not supported on this device")
            }
            
            TopicHeading("Try it in Settings")
            
            Text("This app already includes icon switch buttons in Settings > Debug")
                .footnote()
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
#else
            TopicWarning("Alternate icons are available on iOS only")
#endif
            
            CodeBlockView(.settingsAlternativeIcons)
        }
    }
    
#if os(iOS)
    private func setIcon(_ name: String?) {
        UIApplication.shared.setAlternateIconName(name)
    }
#endif
}

#Preview {
    TopicSettingsAlternativeIcons()
        .darkSchemePreferred()
}
