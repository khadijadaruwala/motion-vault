//
//  DataFetcher.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-06.
//

import Foundation

struct DataFetcher {
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    func fetchTitles(for media: String) async throws -> [Title]{
        guard let baseUrl = tmdbBaseURL else {
            throw NetworkError.missingConfig
        }
        
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        
        guard let fetchTitleURL = URL(string: baseUrl)?
            .appending(path: "3/trending/\(media)/day")
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else {
            throw NetworkError.urlBuildFailed
        }
        
        print(fetchTitleURL)
        
        let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitleURL)
        
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlyingError:
                                                NSError(domain: "DataFetcher",
                                                        code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                                                        userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decoder.decode(APIObject.self, from: data).results
        Constants.addPosterPath(to: &titles)
        return titles
    }
}
