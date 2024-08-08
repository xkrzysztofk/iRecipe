//
//  IngredientCollectionView.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 23/04/2024.
//

import SwiftUI

struct IngredientCollectionView: View {
    let ingredients: [Ingredient]
    let columns: [GridItem] = [GridItem(.fixed(100)),
                               GridItem(.fixed(100)),
                               GridItem(.fixed(100))]
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, content: {
                ForEach(ingredients) { ingredient in
                    IngredientView(ingredient: ingredient)
                }
            })
        }
    }
}

#Preview {
    IngredientCollectionView(ingredients: [Ingredient(name: "Brown Sugar", measure: "1 spoon"), 
                                           Ingredient(name: "Brown Sugar", measure: "1 spoon"),
                                           Ingredient(name: "Brown Sugar", measure: "1 spoon"),
                                           Ingredient(name: "Brown Sugar", measure: "1 spoon")])
}
