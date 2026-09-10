import ScrechKit

#if os(iOS)
struct CompactSidebarNavigationView: View {
    @Environment(NavModel.self) private var nav
    
    @State private var showsSidebar = false
    @State private var dragOffset = 0.0
    
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
        .animation(.snappy(duration: 0.25, extraBounce: 0), value: showsSidebar)
        .animation(.snappy(duration: 0.25, extraBounce: 0), value: dragOffset)
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
        dragOffset = 0
        showsSidebar = true
    }
    
    private func closeSidebar() {
        dragOffset = 0
        showsSidebar = false
    }
    
    private func handleDragChanged(_ value: DragGesture.Value) {
        if showsSidebar {
            dragOffset = max(min(value.translation.width, 0), -sidebarWidth)
        } else if value.startLocation.x <= edgeSwipeWidth && value.translation.width > 0 {
            dragOffset = min(value.translation.width, sidebarWidth)
        }
    }
    
    private func handleDragEnded(_ value: DragGesture.Value) {
        if showsSidebar {
            let predictedWidth = sidebarWidth + value.predictedEndTranslation.width
            
            showsSidebar = predictedWidth > sidebarWidth * 0.5
        } else {
            showsSidebar = value.startLocation.x <= edgeSwipeWidth && value.predictedEndTranslation.width > sidebarWidth * 0.35
        }
        
        dragOffset = 0
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
