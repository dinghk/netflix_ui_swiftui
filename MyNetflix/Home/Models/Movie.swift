//
//  Movie.swift
//  MyNetflix
//
//  Created by Ding Lo on 18/7/2024.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    var categories: [String]
    var genre: HomeGenre = .allGenres
    
    // Detail
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    var epidsodes: [Episode]?
    var movieType: MovieType {
        return epidsodes == nil ? .movie : .tvShow
    }
    var promotionHeadline: String?
    
    // Personalization
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    
    var accentColor: Color = .white
    
    var creators:String
    var cast: String
    
    var moreLikeMovies: [Movie]
    var trailers: [Trailer]
    
    var previewImageName: String
    var previewVideoURL: URL?
    
    var numberOfSeasonsDisplay: String {
        guard let season = numberOfSeasons else { return "" }
        switch season {
        case 1:
            return "1 season"
        default:
            return "\(season) seasons"
        }
    }
    
    var episodeInfoDisplay: String {
        guard let current = currentEpisode else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episdoe) \(defaultEpisodeInfo.episodeName)"
        }
        return "S\(current.season):E\(current.episdoe) \(current.episodeName)"
    }
    
    var episodeDescriptionDisplay: String {
        guard let current = currentEpisode else {
            return defaultEpisodeInfo.description
        }
        return current.description
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episdoe: Int
}

enum MovieType {
    case movie
    case tvShow
}
