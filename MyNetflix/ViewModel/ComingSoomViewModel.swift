//
//  ComingSoomViewModel.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import Foundation
import SwiftUI

class ComingSoomViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
