//
//  AlamofireHttpClient.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 19/04/2024.
//

import Alamofire
import Foundation

final class AlamofireHttpClient {
    
    let baseURL = "https://www.themealdb.com"
    let context = "/api/json/v1/1/"

    func GET<T: Decodable>(_ path: String,
                           parameters: Parameters = .init(),
                           type: T.Type,
                           completion: @escaping (Result<T, AFError>) -> Void) {
        guard let url = self.constructUrlConvertible(path: path, parameters: parameters) else { return }
        
        AF.request(url, method: .get).responseDecodable(of: type.self) { response in
            completion(response.result)
        }
    }
    
    private func constructUrlConvertible(path: String, parameters: Parameters) -> URLConvertible? {
        guard var urlComponents = URLComponents(string: baseURL + context + path) else { return nil }
        
        urlComponents.queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
        
        guard let url = urlComponents.url else { return nil }
        
        return url
    }
}
