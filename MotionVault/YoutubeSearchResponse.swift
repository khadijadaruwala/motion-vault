//
//  YoutubeSearchResponse.swift
//  MotionVault
//
//  Created by Khadija Daruwala on 2026-02-10.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}

struct ItemProperties: Codable {
    let id: IdProperties?
}

struct IdProperties: Codable {
    let videoId: String?
}
