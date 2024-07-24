//
//  SearchResultGrid.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import SwiftUI

struct SearchResultGrid: View {
    let movies: [Movie]
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @Binding var movieDetailToShow: Movie?

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .onTapGesture {
                        movieDetailToShow = movie
                    }
            }
        }
    }
}

#Preview {
    SearchResultGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
}
