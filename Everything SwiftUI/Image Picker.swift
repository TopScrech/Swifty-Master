import SwiftUI
import PhotosUI

struct Image_Picker: View {
    @State private var image: UIImage?
    @State private var photoItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            //            PhotosPicker(selection: $photoItem, matching: .any(of: <#T##[PHPickerFilter]#>)) {
            PhotosPicker(selection: $photoItem) {
                Image(uiImage: image ?? UIImage(resource: .vodka))
                    .resizable()
                    .scaledToFit()
            }
        }
        .onChange(of: photoItem) { _, _ in
            Task {
                if let photoItem,
                   let data = try? await photoItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        self.image = image
                    }
                }
            }
        }
    }
}

#Preview {
    Image_Picker()
}
