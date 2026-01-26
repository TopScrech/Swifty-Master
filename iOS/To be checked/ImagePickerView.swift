import SwiftUI
import OSLog

struct ImagePickerView: View {
    private let logger = Logger()
    
    var body: some View {
        VStack {
            ImagePicker(
                title: "Drag & Drop",
                subTitle: "Tap to add an Image",
                systemImage: "square.and.arrow.up",
                tint: .blue
            ) {
                logger.info("Image picked: \(String(describing: $0))")
            }
        }
        .ignoresSafeArea(edges: [.bottom])
        .navigationTitle("Image Picker")
    }
}

#Preview {
    ImagePickerView()
        .darkSchemePreferred()
}
