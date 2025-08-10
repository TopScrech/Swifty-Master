import SwiftUI

struct NavModePickerItem: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selection: NavMode?
    var navMode: NavMode
    
    init(_ selection: Binding<NavMode?>, navMode: NavMode) {
        _selection = selection
        self.navMode = navMode
    }
    
    var body: some View {
        Button {
            selection = navMode
            dismiss()
        } label: {
            Label(selection: $selection, navMode: navMode)
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
        NavModePickerItem(.constant($0), navMode: $0)
    }
}
