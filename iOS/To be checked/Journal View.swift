#if canImport(JournalingSuggestions)
import SwiftUI
import JournalingSuggestions

@available(iOS 17.2, *)
struct JournalView: View {
    @State var suggestionPhotos = [JournalingSuggestion.Photo]()
    @State var suggestionTitle: String? = nil
    
    var body: some View {
        VStack {
            JournalingSuggestionsPicker {
                Text("Title")
            } onCompletion: { suggestion in
                // Parse the suggestion details
                suggestionTitle = suggestion.title
                suggestionPhotos = await suggestion.content(forType: JournalingSuggestion.Photo.self)
            }
            
            // Display the suggestion details
            Spacer()
                .frame(height: 25)
            
            Text(suggestionTitle ?? "")
            
            List {
                ForEach(suggestionPhotos, id: \.photo) { item in
                    AsyncImage(url: item.photo) { image in
                        image.image?
                            .resizable ()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(maxHeight: 200)
                }
            }
        }
    }
}

@available(iOS 17.2, *)
#Preview {
    JournalView()
}
#endif
