//
//  StandardHomeMovie.swift
//  MyNetflix
//
//  Created by Ding Lo on 18/7/2024.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    var movie: Movie
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(movie.thumbnailURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}

#Preview {
    StandardHomeMovie(movie: exampleMovie1)
        .frame(width: 100, height: 160)
}
