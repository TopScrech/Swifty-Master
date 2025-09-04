import SwiftUI

struct FavoriteListParent: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        if store.favoriteTopics.count > 0 {
            FavoriteList()
        } else {
            ContentUnavailableView("No favorites found", systemImage: "star")
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    FavoriteListParent()
        .environmentObject(ValueStore())
}
