//
//  Errologger.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation

class ErrorLogger {
    static let shared = ErrorLogger()

    private init() {}

    // Loga o erro no console
    func logError(_ error: AppError) {
        print("LOG: \(error.logMessage())")
    }
    
    // Loga o erro e sua origem
    func logErrorWithDetails(_ error: AppError, file: String = #file, function: String = #function, line: Int = #line) {
        print("LOG: \(error.logMessage())")
        print("Occurred in \(file), function \(function), line \(line)")
    }
}
