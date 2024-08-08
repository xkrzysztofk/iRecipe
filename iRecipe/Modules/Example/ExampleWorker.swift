//
//  ExampleWorker.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 21/04/2024.
//

import Alamofire
import Foundation

final class ExampleWorker {
    
    private let httpClient: AlamofireHttpClient = .init()

    public func fetch(mealId: String, completion: @escaping (Result<[MealDomain], AFError>) -> Void) {
        var parameters: Parameters = .init()
        parameters["i"] = mealId
        
        httpClient.GET("random.php", type: MealsRemoteContainer.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.meals.map { MealDomain(from: $0) }))
            case .failure(let error):
                print(error)
            }
        }
    }
}
