import SwiftUI

struct DebugSettingsFavorites: View {
    @EnvironmentObject private var store: ValueStore
    
    var body: some View {
        Section {
            Button {
                store.favoriteTopics = Topic.allCases
            } label: {
                HStack {
                    Text("Add all to favorites")
                    
                    Spacer()
                    
                    Image(systemName: "star")
                        .title3()
                        .foregroundStyle(.yellow)
                }
            }
            
            Button(role: .destructive) {
                store.favoriteTopics = []
            } label: {
                HStack {
                    Text("Remove all favorites")
                    
                    Spacer()
                    
                    Image(systemName: "star.slash")
                        .title3()
                        .foregroundStyle(.red)
                }
            }
            .disabled(store.favoriteTopics.isEmpty)
        }
    }
}

#Preview {
    NavigationStack {
        List {
            DebugSettingsFavorites()
        }
    }
    .environmentObject(ValueStore())
}
