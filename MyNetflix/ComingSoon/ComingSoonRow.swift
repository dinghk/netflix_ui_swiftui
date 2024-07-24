//
//  ComingSoonRow.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import SwiftUI
import Kingfisher
import AVKit

struct ComingSoonRow: View {
    let movie: Movie
    let screen = UIScreen.main.bounds
    var player: AVPlayer {
        AVPlayer(url: exampleVideoURL)
    }
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height:  200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 75)
                        .clipped()
                    
                    Spacer()
                    Button(action: {
                        // remind me
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind Me")
                        }
                    })
                    .padding(.horizontal)
                    
                    Button(action: {
                        movieDetailToShow = movie
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    })
                    .padding(.trailing, 24)
                }
                .font(.subheadline)
                
                VStack(alignment: .leading) {
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    Text(movie.episodeDescriptionDisplay)
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        ComingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
    }
}
