// A data model for a recipe and its metadata, including its related recipes

import SwiftUI

enum Topic: String, Identifiable, CaseIterable, Codable {
    // Content
    case text, textField, textEditor, image, sfSymbols, label, shape, divider, customKeyboard,
         
         // Control
         button, menu, contextMenu, toggle, slider, stepper, picker,
         
         // View
         sheet, popover, alert, emptyView, appStoreOverlay,
         
         // Navigation
         navigationView, navigationStack, navigationSplitView, navigationBar, navigationLink, passAView, link,
         
         // Collections
         vStack, hStack, zStack, list, scrollView, grid, lazyVGrid, lazyHGrid, tabView,
         
         // Layout
         spacer, padding, frame, positionPoint, geometryReader, equalSizeViews,
         
         // Design
         color, gradient,
         
         // System
         detectOSVersion, detectDarkMode, detectDeviceUsed, differentiateOS, detectScreenSize, detectCompactOrRegular, detectLang
    
    var id: String {
        rawValue
    }
    
    var name: String {
        rawValue
    }
    
    var category: Category {
        switch self {
        case .text, .textField, .textEditor, .image, .sfSymbols, .label, .shape, .divider, .customKeyboard:
                .content
            
        case .button, .menu, .contextMenu, .toggle, .slider, .stepper, .picker:
                .control
            
        case .sheet, .popover, .alert, .emptyView, .appStoreOverlay:
                .view
            
        case .navigationView, .navigationStack, .navigationSplitView, .navigationBar, .navigationLink, .passAView, .link:
                .navigation
            
        case .vStack, .hStack, .zStack, .list, .scrollView, .grid, .lazyVGrid, .lazyHGrid, .tabView:
                .collections
            
        case .spacer, .padding, .frame, .positionPoint, .geometryReader, .equalSizeViews:
                .layout
            
        case .color, .gradient:
                .design
            
        case .detectOSVersion, .detectDarkMode, .detectDeviceUsed, .differentiateOS, .detectScreenSize, .detectCompactOrRegular, .detectLang:
                .system
        }
    }
    
    var related: [Topic.ID] {
        []
    }
    
    var icon: String? {
        nil
    }
}

