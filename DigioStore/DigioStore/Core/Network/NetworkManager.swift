//
//  NetworkManager.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchDigioStoreData(completion: @escaping (Result<DigioStore, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    func fetchDigioStoreData(completion: @escaping (Result<DigioStore, Error>) -> Void) {
        guard let storeUrl = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            print("Invalid URL")
            return
        }
        
        print("Fetching data from URL: \(storeUrl)")
        
        URLSession.shared.dataTask(with: storeUrl) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let noDataError = NSError(domain: "No Data", code: -1, userInfo: nil)
                print("No data received")
                completion(.failure(noDataError))
                return
            }
            
            // Log JSON Data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            } else {
                print("Failed to convert data to JSON string")
            }
            
            do {
                let products = try JSONDecoder().decode(DigioStore.self, from: data)
                print("Successfully decoded data")
                completion(.success(products))
            } catch let decodingError {
                print("Error decoding data: \(decodingError.localizedDescription)")
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
