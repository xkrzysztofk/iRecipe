//
//  ExampleViewModel.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 21/04/2024.
//

import Foundation

final class ExampleViewModel: ObservableObject {
    
    private let worker: ExampleWorker = .init()

    @Published var meal: MealDomain? = nil
    
    func fetch() {
        worker.fetch(mealId: "52771") { [weak self] result in
            switch result {
            case .success(let meals):
                self?.meal = meals.first
                print(meals.first?.strInstructions)
            case .failure(let error):
                print(error)
            }
        }
    }
}
