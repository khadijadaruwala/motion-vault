//
//  ViewModel.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-06.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trenddingMovies: [Title] = []
    var trenddingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        
        do{
            async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
            async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
            async let tRMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
            async let tRTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
            trenddingMovies = try await tMovies
            trenddingTV = try await tTV
            topRatedMovies = try await tRMovies
            topRatedTV = try await tRTV
            
            homeStatus = .success
        } catch{
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
