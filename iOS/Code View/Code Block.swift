import Foundation

enum CodeBlock: String {
    case gauges,
         appStoreOverlay,
         toggle, toggleTint,
         textLineLimit,
         spacer,
         dismiss,
         darkMode,
         textField, textFieldDisableAutocorrection,
         textEditor,
         dismissHideBackButton,
         emptyView, emptyViewAnyView,
         mdRegular, mdBoldItalic, mdStrikethrough, mdMonospaced, mdLink
    
    var code: String {
        switch self {
        case .textFieldDisableAutocorrection:
"""
TextField("Placeholder", text: $text)
    .autocorrectionDisabled()
    
    //or
    
    .autocorrectionDisabled(boolProperty)
"""
            
        case .textField:
"""
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Placeholder", text: $text)
    }
}
"""
            
        case .textEditor:
"""
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        TextEditor(text: $text)
    }
}
"""
            
        case .textLineLimit:
"""
Text("GoidaGoida")
    .frame(width: 16)
    .lineLimit(2)
"""
            
        case .emptyViewAnyView:
"""
func view(for option: String) -> AnyView {
    switch option {
    case "A": AnyView(Text("Option A"))
    case "B": AnyView(Image(systemName: "star"))
    default: AnyView(EmptyView())
}
"""
            
        case .darkMode:
"""
struct ContentView: View {
    @Environment(\\.colorScheme) private var colorScheme
    
    var body: some View {
        Text(colorScheme == .dark ? "Dark" : "Light"
    }
}
"""
            
        case .dismissHideBackButton:
"""
struct ContentView: View {
    @State private var hideBackButton = false
    
    var body: some View {
        SomeView {...}
            .navigationBarBackButtonHidden()
            // or
            .navigationBarBackButtonHidden(hideBackButton)
    }
}
"""
            
        case .dismiss:
"""
struct ContentView: View {
    @Environment(\\.dismiss) private var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}
"""
            
        case .emptyView:
"""
EmptyView()
"""
            
        case .spacer:
"""
Spacer()
"""
            
        case .toggleTint:
"""
Toggle("Purple", isOn: $toggle1)
    .tint(.purple)
"""
            
        case .toggle:
"""
struct ContentView: View {
    @State private var toggleIsOn = true
    
    var body: some View {
        Toggle("Toggle", isOn: $isOn)
    }
}
"""
            
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
        .appStoreOverlay($overlay, id: 1639409934)
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
