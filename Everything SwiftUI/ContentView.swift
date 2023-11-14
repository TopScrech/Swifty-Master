import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        List {
            NavigationLink("Materials") {
                MaterialsView()
            }
            
            NavigationLink("Drag and Drop") {
                ImagePickerView()
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
