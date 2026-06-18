import ScrechKit

extension View {
    func symbolCopyContextMenu(_ symbolName: String) -> some View {
        contextMenu {
            Button("Copy Name", systemImage: "document.on.document") {
                Pasteboard.copy(symbolName)
            }
        }
    }
}
