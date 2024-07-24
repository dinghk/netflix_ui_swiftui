//
//  PreviewViewModel.swift
//  MyNetflix
//
//  Created by Ding Lo on 24/7/2024.
//

import Foundation

class PreviewViewModel: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
