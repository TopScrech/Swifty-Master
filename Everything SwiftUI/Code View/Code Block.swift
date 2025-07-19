import Foundation

enum CodeBlock: String {
    case gauges, appStoreOverlay,
         mdRegular, mdBoldItalic, mdStrikethrough, mdMonospaced, mdLink
    
    var code: String {
        switch self {
        case .appStoreOverlay:
"""
import SwiftUI
import StoreKit

@available(iOS 14, *)
public extension View {
    func appStoreOverlay <T: CustomStringConvertible> (
        _ isPresented: Binding<Bool>,
        id: T,
        position: SKOverlay.Position = .bottom
    ) -> some View {
        self.appStoreOverlay(isPresented: isPresented) {
            SKOverlay.AppConfiguration(
                appIdentifier: id.description,
                position: position
            )
        }
    }
}

import SwiftUI

struct AppStoreOverlay: View {
    @State private var overlay = false
    
    var body: some View {
        List {
            Button("Present") {
                overlay = true
            }
        }
#if os(iOS) || os(visionOS)
        .appStoreOverlay($overlay, id: "1639409934")
#endif
    }
}
"""
            
        case .mdBoldItalic:
            "Text(\"This is **bold** text, this is *italic* text, and this is ***bold, italic*** text\")"
            
        case .mdRegular:
            "Text(\"This is regular text\")"
        case .mdLink:
"""
Text("Link: [click](https://topscrech.dev)")
    .tint(.indigo)
"""
        case .mdStrikethrough:
            "Text(\"~~A strikethrough example~~\")"
            
        case .mdMonospaced:
            "Text(\"`Monospaced works too`\")"
            
        case .gauges:
"""
VStack(spacing: 64) {
    GaugeCard("accessoryCircular") {
        Gauge(value: 50, in: 0...100) {
            Text("C")
        }
        .gaugeStyle(.accessoryCircular)
        .tint(.red)
    }
    
    GaugeCard("accessoryCircularCapacity") {
        Gauge(value: 50, in: 0...100) {}
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.green)
    }
    
    GaugeCard("linearCapacity") {
        Gauge(value: 90, in: 0...100) {}
            .gaugeStyle(.linearCapacity)
    }
    
    GaugeCard("accessoryLinear") {
        Gauge(value: 10, in: 0...100) {}
            .gaugeStyle(.accessoryLinear)
    }
    
    GaugeCard("accessoryLinearCapacity") {
        Gauge(value: 10, in: 0...100) {}
            .gaugeStyle(.accessoryLinearCapacity)
            .tint(.brown)
    }
}
.padding(.horizontal)
"""
        }
    }
}
