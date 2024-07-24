//
//  MoreLikeThis.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import SwiftUI

struct MoreLikeThis: View {
    let movies: [Movie]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<movies.count, id:\.self) { index in
                StandardHomeMovie(movie: movies[index])
            }
        }
    }
}

#Preview {
    MoreLikeThis(movies: exampleMovies)
}
