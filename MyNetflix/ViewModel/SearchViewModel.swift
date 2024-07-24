//
//  SearchViewModel.swift
//  MyNetflix
//
//  Created by Ding Lo on 22/7/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var viewSate: ViewState = .ready
    @Published var popularMovies: [Movie] = []
    @Published var searchResult: [Movie] = []
    @Published var isShowingPopularMovies = true
    
    init() {
        getPopularMovies()
    }
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        if !text.isEmpty {
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
    private func getPopularMovies() {
        popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(forText text: String) {
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                // empty
                self.searchResult = []
                self.setViewState(to: .empty)
            } else {
                let movies = generateMovies(21)
                self.searchResult = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewSate = state
            self.isLoading = state == .loading
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
