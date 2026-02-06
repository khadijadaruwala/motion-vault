//
//  Constants.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-05.
//

import Foundation
import SwiftUI

struct Constants{
    static let homeString = "Home"
    static let searchString = "Search"
    static let upcomingString = "Upcoming"
    static let downloadString = "Download"
    static let playString = "Play"
    static let trendingMovieString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMovieString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated TV"
    
    static let homeIconString = "house"
    static let searchIconString = "magnifyingglass"
    static let upcomingIconString = "play.circle"
    static let downloadIconString = "arrow.down.to.line"
    
    static let testTitleURL = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testTitleURL3 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
 
    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
    
    static func addPosterPath(to titles: inout[Title]){
        for index in titles.indices{
            if let posterPath = titles[index].posterPath{
                titles[index].posterPath = "\(posterURLStart)\(posterPath)"
            }
        }
    }
}

extension Text{
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}
