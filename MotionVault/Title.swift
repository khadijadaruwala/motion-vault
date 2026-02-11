//
//  Title.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-05.
//

import Foundation

struct TMDBAPIObject: Decodable {
    var results: [Title] = []
}

struct Title: Decodable, Identifiable, Hashable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "BeetleHuice", name: "BeetleJuice", overview: "A movie about BeetleJuice", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Pulp Fiction", name: "Pulp Fiction", overview: "A movie about Pulp Fiction", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "Dark Knight", name: "Dark Knight", overview: "A movie about Dark Knight", posterPath: Constants.testTitleURL3)]
}
	
