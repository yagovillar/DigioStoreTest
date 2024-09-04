//
//  NetworkManager.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDigioStoreData(completion: @escaping (Result<DigioStore, Error>) -> Void) {
    guard let storeUrl = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") 
        else {
            return
        }
        
        URLSession.shared.dataTask(with: storeUrl) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(DigioStore.self, from: data)
                completion(.success(products))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}

