import ScrechKit

struct SFSymbolRenderingModePicker: View {
    @Binding private var renderingMode: SFSymbolRenderingMode
    
    init(_ renderingMode: Binding<SFSymbolRenderingMode>) {
        _renderingMode = renderingMode
    }
    
    var body: some View {
        Menu {
            Picker("Rendering Mode", selection: $renderingMode) {
                ForEach(SFSymbolRenderingMode.allCases) {
                    Label($0.title, systemImage: $0.systemImage)
                        .tag($0)
                }
            }
        } label: {
            Label(renderingMode.title, systemImage: renderingMode.systemImage)
        }
        .buttonStyle(.bordered)
    }
}
