//
//  Errors.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-05.
//

import Foundation


enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "The file containing the API configuration was not found."
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load the API configuration data: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode the API configuration data: \(error.localizedDescription)"
        }
    }
}

enum NetworkError: Error, LocalizedError{
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "The URL session returned an invalid response: \(error.localizedDescription)"
        case .missingConfig:
            return "The API configuration is missing."
        case .urlBuildFailed:
            return "Failed to build url"
        }
    }
}
