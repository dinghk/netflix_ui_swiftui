//
//  SearchView.swift
//  MyNetflix
//
//  Created by Ding Lo on 22/7/2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchViewModel()
    @State private var searchText = ""
    @State private var movieDetialToShow: Movie? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding(
            get: {
                return searchText
            },
            set: { newValue in
                searchText = newValue
                vm.updateSearchText(with: newValue)
            }
        )
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetialToShow)
                    }
                    
                    if vm.viewSate == .empty {
                        Text("Did not have any result.")
                            .bold()
                            .padding(.top, 150)
                    } else if vm.viewSate == .ready && !vm.isShowingPopularMovies {
                        VStack {
                            HStack {
                                Text("Movies & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 12)
                                Spacer()
                            }
                            
                            SearchResultGrid(movies: vm.searchResult, movieDetailToShow: $movieDetialToShow)
                        }
                    }
                }
                .foregroundStyle(.white)
                
                Spacer()
            }
            
            if let movieDetail = movieDetialToShow {
                MovieDetail(movie: movieDetail, movieDetailToShow: $movieDetialToShow)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    SearchView()
}

struct PopularList: View {
    let movies: [Movie]

    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Movies")
                    .bold()
                    .font(.title)
                    .padding(.leading, 12)
                Spacer()
            }
            
            LazyVStack {
                ForEach(movies) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
