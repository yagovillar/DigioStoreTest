//
//  NetworkManager.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//
import Foundation

protocol NetworkManagerProtocol {
    func fetchDigioStoreData(completion: @escaping (Result<DigioStore, AppError>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {

    func fetchDigioStoreData(completion: @escaping (Result<DigioStore, AppError>) -> Void) {
        guard let storeUrl = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            let error = AppError.invalidURL
            ErrorLogger.shared.logError(error)
            completion(.failure(error))
            return
        }
        
        print("Fetching data from URL: \(storeUrl)")
        
        URLSession.shared.dataTask(with: storeUrl) { data, response, error in
            if let error = error {
                let appError = AppError.networkError(error)
                ErrorLogger.shared.logError(appError)
                completion(.failure(appError))
                return
            }
            
            guard let data = data else {
                let appError = AppError.noData
                ErrorLogger.shared.logError(appError)
                completion(.failure(appError))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(DigioStore.self, from: data)
                print("Successfully decoded data")
                completion(.success(products))
            } catch let decodingError {
                let appError = AppError.decodingError(decodingError)
                ErrorLogger.shared.logError(appError)
                completion(.failure(appError))
            }
        }.resume()
    }
}
