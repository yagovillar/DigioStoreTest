//
//  AppError.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation

enum AppError: Error {
    case networkError(Error)      // Erro de rede, encapsula o erro original
    case invalidURL               // URL inválida
    case noData                   // Nenhum dado foi retornado
    case decodingError(Error)     // Erro ao decodificar o JSON
    case custom(String)           // Mensagem de erro customizada
    
    // Mensagem amigável para o usuário
    func userFriendlyMessage() -> String {
        switch self {
        case .networkError:
            return "Network error occurred. Please check your connection and try again."
        case .invalidURL:
            return "Invalid URL. Please contact support."
        case .noData:
            return "No data received. Please try again later."
        case .decodingError:
            return "Failed to process data. Please try again later."
        case .custom(let message):
            return message
        }
    }
    
    // Log do erro para ser enviado ao sistema de log ou console
    func logMessage() -> String {
        switch self {
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidURL:
            return "Error: Invalid URL"
        case .noData:
            return "Error: No data received from the server"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .custom(let message):
            return "Custom error: \(message)"
        }
    }
}

