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
    
    func getTitles() async {
        homeStatus = .fetching
        
        do{
            trenddingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .success
        } catch{
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
