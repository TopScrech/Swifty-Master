import SwiftUI

struct NavModePickerItem: View {
    @EnvironmentObject private var store: ValueStore
    @Environment(\.dismiss) private var dismiss
    
    private let navMode: NavMode
    
    init(_ navMode: NavMode) {
        self.navMode = navMode
    }
    
    var body: some View {
        Button {
            store.navMode = navMode
            dismiss()
        } label: {
            Label(selection: $store.navMode, navMode: navMode)
        }
        .buttonStyle(.plain)
    }
}

private struct Label: View {
    @Binding var selection: NavMode?
    var navMode: NavMode
    
    @State private var isHovering = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: navMode.icon)
                .title()
                .foregroundStyle(shapeStyle(Color.accentColor))
            
            Text(navMode.name)
                .bold()
                .foregroundStyle(shapeStyle(.primary))
        }
        .shadow(radius: selection == navMode ? 4 : 0)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(selection == navMode ?
                      AnyShapeStyle(Color.accentColor) :
                        AnyShapeStyle(.background))
            
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(isHovering ? Color.accentColor : .clear)
        }
        .scaleEffect(isHovering ? 1.02 : 1)
        .onHover { isHovering in
            withAnimation {
                self.isHovering = isHovering
            }
        }
    }
    
    private func shapeStyle<S: ShapeStyle>(_ style: S) -> some ShapeStyle {
        if selection == navMode {
            AnyShapeStyle(.background)
        } else {
            AnyShapeStyle(style)
        }
    }
}

#Preview {
    ForEach(NavMode.allCases) {
        NavModePickerItem($0)
    }
    .environmentObject(ValueStore())
}
