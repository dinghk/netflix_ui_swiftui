//
//  HomeStackView.swift
//  MyNetflix
//
//  Created by Ding Lo on 22/7/2024.
//

import SwiftUI

struct HomeStackView: View {
    let vm: HomeViewModel
    let topRowSelection: HomeTopRow
    let selectedGenre: HomeGenre
    @Binding var movieDetailToShow: Movie?
    @Binding var showPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        ForEach(vm.allCategories, id:\.self) { category in
            VStack {
                HStack {
                    Text(category)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovie(forCat: category, withHomeRow: topRowSelection, withGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 135, height: 200)
                                .onTapGesture(perform: {
                                    movieDetailToShow = movie
                                })
                        }
                    }
                }
            }
            .padding(.leading, 6)
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        ScrollView {
            HomeStackView(vm: HomeViewModel(), topRowSelection: .movies, selectedGenre: .allGenres, movieDetailToShow: .constant(nil), showPreviewFullScreen: .constant(false), previewStartingIndex: .constant(0))
        }
        .foregroundStyle(.white)
    }
}
