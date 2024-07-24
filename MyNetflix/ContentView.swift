//
//  ContentView.swift
//  MyNetflix
//
//  Created by Ding Lo on 18/7/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex: Int = 0
    @State private var previewCurrentPos: CGFloat = 1000
    @State private var previewNewPos: CGFloat = 1000
    @State private var previewHorizontalDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                if previewHorizontalDragActive {
                    return
                }
                
                if previewCurrentPos == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        previewHorizontalDragActive = true
                        return
                    }
                }
                
                let shouldBePosition = value.translation.height + previewNewPos
                if shouldBePosition < 0 {
                    return
                } else {
                    previewCurrentPos = shouldBePosition
                }
                
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                let shouldBePostion = value.translation.height + previewNewPos
                if shouldBePostion < 0 {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                } else {
                    let closingPoint = screen.size.height * 0.2
                    if shouldBePostion > closingPoint {
                        withAnimation {
                            showPreviewFullScreen = false
                            previewCurrentPos = screen.height + 20
                            previewNewPos = screen.height + 20
                        }
                    } else {
                        withAnimation {
                            previewNewPos = .zero
                            previewCurrentPos = .zero
                        }
                    }
                }
                previewHorizontalDragActive = false
            }
        
        ZStack {
            TabView {
                HomeView(
                    showPreviewFullScreen: $showPreviewFullScreen,
                    previewStartingIndex: $previewStartingIndex
                )
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
                
                ComingSoon()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }.tag(2)
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }.tag(3)
            }
            .accentColor(.white)
            
            PreviewList(
                movies: exampleMovies,
                currentSelection: $previewStartingIndex,
                isVisible: $showPreviewFullScreen, 
                externalDragGesture: previewDragGesture
            )
            .offset(y: previewCurrentPos)
            .isHidden(!showPreviewFullScreen)
            .animation(.easeIn, value: UUID())
            .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen) { oldValue, newValue in
            if newValue {
                withAnimation {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                }
            } else {
                withAnimation {
                    previewCurrentPos = screen.height + 20
                    previewNewPos = screen.height + 20
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
