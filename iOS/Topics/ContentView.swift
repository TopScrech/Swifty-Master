import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: ValueStore
    
    private let topic: Topic
    
    init(_ topic: Topic) {
        self.topic = topic
    }
    
    var body: some View {
        VStack(spacing: 25) {
            if let view = topicView(topic) {
                view
            }
            
            TopicDocs(topic.docs)
        }
        .scenePadding()
        .toolbar {
            Button {
                store.addOrRemoveFavorite(topic)
            } label: {
                if store.favoriteTopics.contains(topic) {
                    Image(systemName: "star.slash.fill")
                } else {
                    Image(systemName: "star")
                }
            }
            .foregroundStyle(.yellow)
            
            if let url = topic.shareLink {
                ShareLink(item: url)
            }
        }
    }
}

func topicView(_ topic: Topic) -> AnyView? {
    switch topic {
        // Content
    case .text: AnyView(TopicText())
    case .textField: AnyView(TopicTextField())
    case .textEditor: AnyView(TopicTextEditor())
    case .image: AnyView(TopicImage())
    case .sfSymbols: AnyView(TopicSFSymbols())
    case .label: AnyView(TopicLabel())
    case .shape: AnyView(TopicShape())
    case .divider: AnyView(TopicDivider())
    case .customKeyboard: AnyView(TopicCustomKeyboard())
        
        // Control
    case .toggle: AnyView(TopicToggle())
    case .button: AnyView(TopicButton())
    case .menu: AnyView(TopicMenu())
    case .contextMenu: AnyView(TopicContextMenu())
    case .slider: AnyView(TopicSlider())
    case .stepper: AnyView(TopicStepper())
    case .picker: AnyView(TopicPicker())
        
        // View
    case .emptyView: AnyView(TopicEmptyView())
    case .appStoreOverlay: AnyView(AppStoreOverlay())
    case .sheet: AnyView(TopicSheet())
    case .alert: AnyView(TopicAlert())
    case .popover: AnyView(TopicPopover())
        
        // Nav
    case .dismiss: AnyView(TopicDismiss())
        
        // Layout
    case .spacer: AnyView(TopicSpacer())
        
        // Design
    case .color: AnyView(TopicColor())
    case .gradient: AnyView(TopicGradient())
        
        // System
    case .detectDarkMode: AnyView(TopicDarkMode())
    case .detectOSVersion: AnyView(TopicDetectOSVersion())
    case .lowPowerMode: AnyView(TopicLowPowerMode())
    case .detectLang: AnyView(TopicDetectLaguage())
        
    default: nil
    }
}

#Preview {
    ContentView(.dismiss)
        .environmentObject(ValueStore())
}
