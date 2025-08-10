import SwiftUI

struct TopicPicker: View {
    @State private var favoriteAnimal = "Dog"
    
    var body: some View {
        VStack(spacing: 25) {
            Text("SwiftUI's Picker is a customizable, interactive way allowing users to select from a list of options")
            
            Picker("Favorite animal", selection: $favoriteAnimal) {
                Text("Dog")
                    .tag("Dog")
                
                Text("Cat")
                    .tag("Cat")
                
                Text("Fish")
                    .tag("Fish")
            }
            
            CodeBlockView(.picker)
        }
    }
}

#Preview {
    TopicPicker()
        .darkSchemePreferred()
}
