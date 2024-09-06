//
//  NetworkManagerMock.swift
//  DigioStoreTests
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import Foundation
@testable import DigioStore

class MockNetworkManager: NetworkManagerProtocol {
    var result: Result<DigioStore, AppError>?
    
    func fetchDigioStoreData(completion: @escaping (Result<DigioStore, AppError>) -> Void) {
        if let result = result {
            completion(result)
        }
    }
}
