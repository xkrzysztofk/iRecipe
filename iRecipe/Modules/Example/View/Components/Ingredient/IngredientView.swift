//
//  IngredientView.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 23/04/2024.
//

import SwiftUI

struct IngredientView: View {
    let ingredient: Ingredient
    
    var body: some View {
        VStack {
            Text(ingredient.name)
                .font(.headline)
            CachedImageCircled(urlString: ingredient.urlString, width: 70, height: 70)
            Text(ingredient.measure)
                .font(.callout)
        }
    }
}

#Preview {
    IngredientView(ingredient: Ingredient(name: "Brown Sugar", measure: "1 spoon"))
}
