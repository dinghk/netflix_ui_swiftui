//
//  PopularMovieView.swift
//  MyNetflix
//
//  Created by Ding Lo on 22/7/2024.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    let movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                
                Text(movie.name)
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "arrowtriangle.right.fill")
                }
                .padding(.trailing, 20)
                
            }
            .foregroundStyle(.white)
            .onTapGesture(perform: {
                self.movieDetailToShow = movie
            })
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        PopularMovieView(movie: exampleMovie3, movieDetailToShow: .constant(nil))
            .frame(height: 75)
    }
}
