// An enumeration of topic groupings used to display sidebar items

import SwiftUI

enum Category: Int, CaseIterable, Identifiable, Codable {
    case content,         // Text, TextField, Text Editor, Image, SF Symbols, Label, Shape, Divider, Custom Keyboard
         control,        // Button, Menu, Context Menu, Toggle, Slider, Stepper, Picker
         view,          // Sheet, Popover, Alert, Empty View, App Store Overlay
         navigation,   // Navigation View, Navigation Stack, Navigation Split View, Navigation Bar, Navigation Link, Pass a view, Link
         collections, // VStack, HStack, ZStack, List, ScrollView, Grid, LazyVGrid, LazyHGrid, TabView
         layout,     // Spacer, Padding, Frame, Position Point, Geometry Reader, Equal Size Views
         design,    // Color, Gradient
         system    // Detect OS version, detect Dark Mode, Detect device used, Differentiate OS, Detect screen size, detect compact or regular mode, detect lang
    
    var id: Int {
        rawValue
    }
    
    /// The localized name of the topic category.
    var localizedName: LocalizedStringKey {
        switch self {
        case .content:     "Content"
        case .control:     "Control"
        case .view:        "View"
        case .navigation:  "Navigation"
        case .collections: "Collections"
        case .layout:      "Layout"
        case .design:      "Design"
        case .system:      "System"
        }
    }
}
