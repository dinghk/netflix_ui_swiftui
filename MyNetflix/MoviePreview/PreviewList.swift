//
//  PreviewList.swift
//  MyNetflix
//
//  Created by Ding Lo on 24/7/2024.
//

import SwiftUI

struct PreviewList: View {
    let movies: [Movie]
    
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    @State private var currentTranslation: CGFloat = 0
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            PagerView(
                pageCount: movies.count,
                currentIndex: $currentSelection,
                translation: $currentTranslation, 
                externalDeagGesture: externalDragGesture) {
                    ForEach(0..<movies.count, id:\.self) { index in
                        let movie = movies[index]
                        
                        PreviewView(
                            isPlayVideo: shouldPlayVideo(index: index),
                            vm: PreviewViewModel(movie: movie)
                        )
                            .frame(width: screen.width)
                    }
                }
                .frame(width: screen.width)
        }
    }
    
    private func shouldPlayVideo(index: Int) -> Bool {
        if !isVisible {
            return false
        }
        
        if index != currentSelection {
            return false
        }
        
        return true
    }
}

//struct ExamplePreviewList: View {
//    @State private var currentSelection = 0
//    @State private var isVisible = true
//    
//    var body: some View {
//        PreviewList(
//            movies: exampleMovies,
//            currentSelection: $currentSelection,
//            isVisible: $isVisible
//        )
//    }
//}
//
//#Preview {
//    ExamplePreviewList()
//}
