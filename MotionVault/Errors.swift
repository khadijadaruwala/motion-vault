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
