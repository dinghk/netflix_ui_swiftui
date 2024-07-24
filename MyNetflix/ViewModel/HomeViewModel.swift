//
//  HomeViewModel.swift
//  MyNetflix
//
//  Created by Ding Lo on 18/7/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    public var allGenre: [HomeGenre] = [.allGenres, .action, .comedy, .horror, .thriller]
    
    init() {
        setupMovies()
    }
    
    public func getMovie(forCat cat: String, withHomeRow homeRow: HomeTopRow, withGenre genre: HomeGenre) -> [Movie] {
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .myList:
            // TODO: setup MyList
            return movies[cat] ?? []
        }
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
    }
}
