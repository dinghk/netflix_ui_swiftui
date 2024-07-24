//
//  Episode.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    var name: String
    var season: Int
    var thumbnailImageURL: String
    var description: String
    var length: Int
    var episodeNumber: Int
    
    var videoURL: URL
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURL)!
    }
}
