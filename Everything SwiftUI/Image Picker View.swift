import SwiftUI

struct ImagePickerView: View {
    var body: some View {
        VStack {
            ImagePicker(
                title: "Drag & Drop",
                subTitle: "Tap to add an Image",
                systemImage: "square.and.arrow.up",
                tint: .blue
            ) { image in
                print(image)
            }
        }
        .ignoresSafeArea(edges: [.bottom])
        .navigationTitle("Image Picker")
    }
}

#Preview {
    ImagePickerView()
}
