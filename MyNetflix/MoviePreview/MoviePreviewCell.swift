//
//  MoviePreviewCell.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {
    let movie: Movie
    let colors: [Color] = [.yellow, .green, .gray, .blue, .pink, .orange, .red, .purple, .brown, .mint]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundStyle(colors.randomElement()!)
            )
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 65)
                .offset(y: -20)
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        MoviePreviewCell(movie: exampleMovie3)
            .frame(width: 165, height: 50)
    }
}
