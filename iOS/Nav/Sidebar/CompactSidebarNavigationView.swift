import ScrechKit

#if os(iOS)
struct CompactSidebarNavigationView: View {
    @Environment(NavModel.self) private var nav
    
    @State private var showsSidebar = false
    @State private var dragOffset = 0.0
    @State private var acceptsSidebarDrag: Bool?
    
    private let sidebarWidth = 280.0
    private let edgeSwipeWidth = 24.0
    
    var body: some View {
        @Bindable var nav = nav
        let visibleWidth = sidebarVisibleWidth()
        let progress = visibleWidth / sidebarWidth
        
        ZStack(alignment: .leading) {
            NavigationStack(path: $nav.topicPath) {
                CategoryTopicsView()
                    .navigationDestination(for: Topic.self) {
                        TopicDetail($0)
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Categories", systemImage: "sidebar.left", action: openSidebar)
                        }
                    }
                    .navContainerToolbar()
            }
            .disabled(showsSidebar)
            
            if visibleWidth > 0 {
                Button(action: closeSidebar) {
                    Rectangle()
                        .fill(.black.opacity(0.25 * progress))
                        .ignoresSafeArea()
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Close sidebar")
                .transition(.opacity)
            }
            
            if visibleWidth > 0 {
                TopicSidebarPanel(onSelect: closeSidebar)
                    .frame(width: sidebarWidth)
                    .background(.thickMaterial)
                    .offset(x: visibleWidth - sidebarWidth)
                    .transition(.move(edge: .leading))
            }
        }
        .simultaneousGesture(
            DragGesture()
                .onChanged(handleDragChanged)
                .onEnded(handleDragEnded)
        )
        .onAppear {
            nav.ensureSelectedCategory()
        }
    }
    
    private func sidebarVisibleWidth() -> CGFloat {
        if showsSidebar {
            max(min(sidebarWidth + dragOffset, sidebarWidth), 0)
        } else {
            max(min(dragOffset, sidebarWidth), 0)
        }
    }
    
    private func openSidebar() {
        withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
            dragOffset = 0
            showsSidebar = true
        }
    }
    
    private func closeSidebar() {
        withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
            dragOffset = 0
            showsSidebar = false
        }
    }
    
    private func handleDragChanged(_ value: DragGesture.Value) {
        if acceptsSidebarDrag == nil {
            let translation = value.translation
            let isHorizontal = abs(translation.width) > abs(translation.height)
            acceptsSidebarDrag = isHorizontal && (showsSidebar
                ? translation.width < 0
                : value.startLocation.x > edgeSwipeWidth && translation.width > 0)
        }

        guard acceptsSidebarDrag == true else { return }

        if showsSidebar {
            dragOffset = max(min(value.translation.width, 0), -sidebarWidth)
        } else {
            dragOffset = max(min(value.translation.width, sidebarWidth), 0)
        }
    }
    
    private func handleDragEnded(_ value: DragGesture.Value) {
        defer { acceptsSidebarDrag = nil }
        guard acceptsSidebarDrag == true else { return }

        withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
            let predictedWidth = (showsSidebar ? sidebarWidth : 0) + value.predictedEndTranslation.width
            showsSidebar = predictedWidth > sidebarWidth * 0.5
            dragOffset = 0
        }
    }
}

#Preview {
    CompactSidebarNavigationView()
        .darkSchemePreferred()
        .environment(DataModel.shared)
        .environment(NavModel.shared)
        .environmentObject(ValueStore())
}
#endif
