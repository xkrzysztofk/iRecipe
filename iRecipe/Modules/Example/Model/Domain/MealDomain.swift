//
//  MealDomain.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 21/04/2024.
//

import Foundation

struct Ingredient: Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let measure: String
    
    var urlString: String {
        return "https://www.themealdb.com/images/ingredients/\(name).png"
    }
}

struct MealDomain {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let tags: [String]?
    let strYoutube: String
    let ingredients: [Ingredient]
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?

    init(from remote: MealRemote) {
        idMeal = remote.idMeal
        strMeal = remote.strMeal
        strDrinkAlternate = remote.strDrinkAlternate
        strCategory = remote.strCategory
        strArea = remote.strArea
        strInstructions = remote.strInstructions
        strMealThumb = remote.strMealThumb
        tags = remote.strTags?.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        strYoutube = remote.strYoutube
        strSource = remote.strSource
        strImageSource = remote.strImageSource
        strCreativeCommonsConfirmed = remote.strCreativeCommonsConfirmed
        dateModified = remote.dateModified

        //TODO: Think of better way of doing this
        
        var ingredientsArray: [Ingredient] = []

        if let name = remote.strIngredient1, let measure = remote.strMeasure1, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient2, let measure = remote.strMeasure2, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient3, let measure = remote.strMeasure3, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient4, let measure = remote.strMeasure4, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient5, let measure = remote.strMeasure5, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient6, let measure = remote.strMeasure6, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient7, let measure = remote.strMeasure7, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient8, let measure = remote.strMeasure8, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient9, let measure = remote.strMeasure9, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient10, let measure = remote.strMeasure10, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient11, let measure = remote.strMeasure11, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient12, let measure = remote.strMeasure12, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient13, let measure = remote.strMeasure13, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient14, let measure = remote.strMeasure14, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient15, let measure = remote.strMeasure15, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient16, let measure = remote.strMeasure16, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient17, let measure = remote.strMeasure17, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient18, let measure = remote.strMeasure18, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient19, let measure = remote.strMeasure19, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }
        if let name = remote.strIngredient20, let measure = remote.strMeasure20, !name.isEmpty, !measure.isEmpty {
            ingredientsArray.append(Ingredient(name: name, measure: measure))
        }

        ingredients = ingredientsArray
    }
}
