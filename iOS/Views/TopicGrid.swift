import SwiftUI

struct TopicGrid: View {
    @Environment(NavModel.self) private var navigationModel
    @Environment(DataModel.self) private var dataModel
    
    private let columns = [
        GridItem(.adaptive(minimum: 240))
    ]
    
    var body: some View {
        if let category = navigationModel.selectedCategory {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(dataModel.recipes(in: category)) { recipe in
                        NavigationLink(value: recipe) {
                            TopicTile(recipe)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle(category.localizedName)
            .navigationDestination(for: Topic.self) { recipe in
                TopicDetail(recipe) { relatedRecipe in
                    Button {
                        navigationModel.recipePath.append(relatedRecipe)
                    } label: {
                        TopicTile(relatedRecipe)
                    }
                    .buttonStyle(.plain)
                }
                .experienceToolbar()
            }
        } else {
            Text("Choose a category")
                .navigationTitle("")
        }
    }
}

#Preview {
    TopicGrid()
        .environment(DataModel.shared)
        .environment(NavModel(selectedCategory: .content))
}

#Preview {
    TopicGrid()
        .environment(DataModel.shared)
        .environment(NavModel(selectedCategory: nil))
}
