// A data model for a topic and its metadata, including its related topics

import SwiftUI

enum Topic: String, Identifiable, CaseIterable, Codable {
    // Content
    case text,
         textField,
         textEditor,
         image,
         sfSymbolsExplorer,
         label,
         shape,
         divider,
         gauges,
         progressView,
         badges,
         
         // Control
         button,
         menu,
         contextMenu,
         toggle,
         slider,
         stepper,
         picker,
         
         // View
         sheet,
         popover,
         alert,
         confirmationDialog,
         emptyView,
         appStoreOverlay,
         customViewModifiers,
         
         // Navigation
         dismiss,
         navigationView,
         navigationStack,
         navigationSplitView,
         navigationBar,
         navigationLink,
         passAView,
         link,
         shareLink,
         
         // Collections
         vStack,
         hStack,
         zStack,
         list,
         swipeActions,
         scrollView,
         grids,
         tabView,
         
         // Layout
         spacer,
         padding,
         frame,
         //         positionPoint = "Position Point",
         geometryReader,
         equalSizeViews,
         
         // Design
         color,
         gradient,
         
         // System
         detectOSVersion,
         detectDarkMode,
         detectScreenSize,
         detectCompactOrRegular,
         detectLang,
         lowPowerMode,
         preventScreenSleep,
         preventScreenshots,
         settingsAlternativeIcons,
         
         // New in Xcode 27
         differentiateOS,
         enumPreview,
         reorderableContainers,
         swipeActionsInContainers,
         asyncImageCaching
    
    var id: String {
        rawValue
    }
    
    var name: String {
        metadata.title
    }
    
    var localizedName: LocalizedStringKey {
        LocalizedStringKey(name)
    }
    
    var shareLink: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Self.shareLinkHost
        components.percentEncodedPath = "/" + Self.encodedShareLinkPath(name)
        return components.url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        
        guard let topic = Self.topic(matching: value) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unknown topic: \(value)"
            )
        }
        
        self = topic
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(id)
    }
    
    static func topic(from url: URL) -> Topic? {
        guard
            let host = url.host,
            Self.shareLinkHosts.contains(host)
        else {
            return nil
        }
        
        let pathComponents = url.pathComponents.filter {
            $0 != "/"
        }
        
        for component in pathComponents.reversed() {
            if let match = Self.topic(matching: component) {
                return match
            }
        }
        
        if
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let topicQuery = components.queryItems?.first(where: { $0.name == "topic" })?.value,
            let match = Self.topic(matching: topicQuery)
        {
            return match
        }
        
        if
            let fragment = url.fragment,
            let match = Self.topic(matching: fragment)
        {
            return match
        }
        
        return nil
    }
    
    private static let shareLinkHost = "swift-hub.dev"
    private static let shareLinkHosts: Set<String> = ["swift-hub.dev", "www.swift-hub.dev"]
    
    private static func encodedShareLinkPath(_ topic: String) -> String {
        topic.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? topic
    }
    
    static func topic(matching candidate: String) -> Topic? {
        let decoded = candidate.removingPercentEncoding ?? candidate
        let normalized = decoded
            .replacing("-", with: " ")
            .replacing("_", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        return Topic.allCases.first {
            $0.rawValue.caseInsensitiveCompare(decoded) == .orderedSame ||
            $0.name.caseInsensitiveCompare(decoded) == .orderedSame ||
            $0.name.caseInsensitiveCompare(normalized) == .orderedSame
        }
    }
}
