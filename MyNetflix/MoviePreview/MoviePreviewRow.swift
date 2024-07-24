//
//  MoviePreviewRow.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import SwiftUI

struct MoviePreviewRow: View {
    let movies: [Movie]
    
    @Binding var showPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Preview")
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<movies.count, id:\.self) { movieIdx in
                        let movie = movies[movieIdx]
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 14)
                            .padding(.leading, 6)
                            .onTapGesture(perform: {
                                previewStartingIndex = movieIdx
                                showPreviewFullScreen = true
                            })
                    }
                }
            }
        }
        .frame(height: 185)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        MoviePreviewRow(movies: exampleMovies, showPreviewFullScreen: .constant(false), previewStartingIndex: .constant(0))
    }
}
