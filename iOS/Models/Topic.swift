// A data model for a topic and its metadata, including its related topics

import SwiftUI

enum Topic: String, Identifiable, CaseIterable, Codable {
    // Content
    case text = "Text",
         textField = "Text Field",
         textEditor = "Text Editor",
         image = "Image",
         label = "Label",
         shape = "Shape",
         divider = "Divider",
         gauges = "Gauges",
         progressView = "ProgressView",
         badges = "Badges",
         
         // Control
         button = "Button",
         menu = "Menu",
         contextMenu = "Context Menu",
         toggle = "Toggle",
         slider = "Slider",
         stepper = "Stepper",
         picker = "Picker",
         
         // View
         sheet = "Sheet",
         popover = "Popover",
         alert = "Alert",
         confirmationDialog = "Confirmation Dialog",
         emptyView = "Empty View",
         appStoreOverlay = "App Store Overlay",
         
         // Navigation
         dismiss = "Dismiss",
         navigationView = "Navigation View",
         navigationStack = "Navigation Stack",
         navigationSplitView = "Navigation Split View",
         navigationBar = "Navigation Bar",
         navigationLink = "Navigation Link",
         passAView = "Pass a View",
         link = "Link",
         shareLink = "ShareLink",
         
         // Collections
         vStack = "VStack",
         hStack = "HStack",
         zStack = "ZStack",
         list = "List",
         swipeActions = "Swipe Actions",
         scrollView = "ScrollView",
         grids = "Grids",
         tabView = "TabView",
         
         // Layout
         spacer = "Spacer",
         padding = "Padding",
         frame = "Frame",
         //         positionPoint = "Position Point",
         geometryReader = "Geometry Reader",
         equalSizeViews = "Equal Size Views",
         
         // Design
         color = "Color",
         gradient = "Gradient",
         
         // System
         detectOSVersion = "Detect OS Version",
         detectDarkMode = "Detect Dark Mode",
         differentiateOS = "Differentiate OS",
         detectScreenSize = "Detect Screen Size",
         detectCompactOrRegular = "Detect Compact or Regular",
         detectLang = "Detect Language",
         lowPowerMode = "Low Power Mode",
         preventScreenSleep = "Prevent Screen Sleep",
         preventScreenshots = "Prevent Screenshots",
         settingsAlternativeIcons = "Settings Alternative Icons"
    
    var id: String {
        rawValue
    }
    
    var name: String {
        rawValue
    }
    
    var shareLink: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Self.shareLinkHost
        components.percentEncodedPath = "/" + Self.encodedShareLinkPath(rawValue)
        return components.url
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
            if let match = Self.matchingTopic(for: component) {
                return match
            }
        }
        
        if
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let topicQuery = components.queryItems?.first(where: { $0.name == "topic" })?.value,
            let match = Self.matchingTopic(for: topicQuery)
        {
            return match
        }
        
        if
            let fragment = url.fragment,
            let match = Self.matchingTopic(for: fragment)
        {
            return match
        }
        
        return nil
    }
    
    private static let shareLinkHost = "swift-docs.com"
    private static let shareLinkHosts: Set<String> = ["swift-docs.com", "www.swift-docs.com"]
    
    private static func encodedShareLinkPath(_ topic: String) -> String {
        topic.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? topic
    }
    
    private static func matchingTopic(for candidate: String) -> Topic? {
        let decoded = candidate.removingPercentEncoding ?? candidate
        let normalized = decoded
            .replacingOccurrences(of: "-", with: " ")
            .replacingOccurrences(of: "_", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        return Topic.allCases.first {
            $0.rawValue.caseInsensitiveCompare(decoded) == .orderedSame ||
            $0.rawValue.caseInsensitiveCompare(normalized) == .orderedSame
        }
    }
}
