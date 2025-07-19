import SwiftUI

struct TopicDetail<Link: View>: View {
    var recipe: Topic?
    var relatedLink: (Topic) -> Link
    
    var body: some View {
        if let recipe {
            Content(
                recipe: recipe,
                relatedLink: relatedLink
            )
            .id(recipe.id)
        } else {
            Text("Choose a recipe")
                .navigationTitle("")
        }
    }
}

private struct Content<Link: View>: View {
    @Environment(DataModel.self) private var dataModel
    
    var recipe: Topic
    var relatedLink: (Topic) -> Link
    
    var body: some View {
        ScrollView {
            ViewThatFits(in: .horizontal) {
                wideDetails
                narrowDetails
            }
            .scenePadding()
        }
        .navigationTitle(recipe.name)
    }
    
    private var wideDetails: some View {
        VStack(alignment: .leading) {
            title
            
            HStack(alignment: .top, spacing: 20) {
                ingredients
                
                Spacer()
            }
            
            relatedRecipes
        }
    }
    
    @ViewBuilder
    private var narrowDetails: some View {
#if os(macOS)
        HStack {
            narrowDetailsContent
            
            Spacer()
        }
#else
        narrowDetailsContent
#endif
    }
    
    private var narrowDetailsContent: some View {
        VStack(alignment: narrowDetailsAlignment) {
            title
            ingredients
            relatedRecipes
        }
    }
    
    private var narrowDetailsAlignment: HorizontalAlignment {
#if os(macOS)
        .leading
#else
        .center
#endif
    }
    
    @ViewBuilder
    private var title: some View {
#if os(macOS)
        Text(recipe.name)
            .largeTitle(.bold)
#endif
    }
    
    private let columns = [
        GridItem(.adaptive(minimum: 120, maximum: 120))
    ]
    
    @ViewBuilder
    private var ingredients: some View {
        let padding = EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0)
        
        VStack(alignment: .leading) {
            Text("Ingredients")
                .title2(.bold)
                .padding(padding)
        }
        .frame(minWidth: 300, alignment: .leading)
    }
    
    @ViewBuilder
    private var relatedRecipes: some View {
        let padding = EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0)
        
        if !recipe.related.isEmpty {
            VStack(alignment: .leading) {
                Text("Related Recipes")
                    .title2(.bold)
                    .padding(padding)
                
                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    let relatedRecipes = dataModel.recipes(relatedTo: recipe)
                    
                    ForEach(relatedRecipes) { relatedRecipe in
                        relatedLink(relatedRecipe)
                    }
                }
            }
        }
    }
}

//#Preview() {
//    TopicDetail(recipe: .mock) { _ in
//        EmptyView()
//    }
//    .environment(DataModel.shared)
//}
