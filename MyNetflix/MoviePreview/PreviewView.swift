//
//  PreviewView.swift
//  MyNetflix
//
//  Created by Ding Lo on 24/7/2024.
//

import SwiftUI

struct PreviewView: View {
    var isPlayVideo: Bool
    
    @ObservedObject var vm: PreviewViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            TrailerPlayerView(
                videoURL: vm.movie.trailers.first?.videoURL,
                isPlayVideo: .constant(isPlayVideo)
            )
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(vm.movie.name)
                            .foregroundStyle(vm.movie.accentColor)
                            .bold()
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                Spacer()
                
                HStack {
                    ForEach(0..<vm.movie.categories.count, id:\.self) { index in
                        let category = vm.movie.categories[index]
                        
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if index != vm.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    SmallVerticalButton(
                        text: "My List",
                        isOnImage: "checkmark",
                        isOffImage: "plus",
                        isOn: true,
                        color: vm.movie.accentColor) {
                            //
                        }
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(vm.movie.accentColor, width: 3)
                    }
                    
                    Spacer()
                    
                    SmallVerticalButton(
                        text: "Info",
                        isOnImage: "info.circle",
                        isOffImage: "info.circle",
                        isOn: true,
                        color: vm.movie.accentColor) {
                            //
                        }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .padding(.bottom, 48)
            .foregroundStyle(vm.movie.accentColor)
        }
        .ignoresSafeArea(edges: .vertical)
    }
}

#Preview {
    PreviewView(isPlayVideo: true, vm: PreviewViewModel(movie: exampleMovie1))
}
