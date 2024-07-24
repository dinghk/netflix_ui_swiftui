//
//  ComingSoon.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import SwiftUI

struct ComingSoon: View {
    let screen = UIScreen.main.bounds
    @State private var showNotificationList = false
    @State private var navBarHidden = true
    @State private var movieDetialToShow: Movie? = nil
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    @ObservedObject var vm = ComingSoomViewModel()
    
    var body: some View {
        let movies = vm.movies.enumerated().map({ $0 })
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newValue in
            scrollOffset = newValue
            updateActiveIndex(fromScroll: newValue)
        }

        
//        NavigationView {
            return Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(Array(movies), id:\.offset) { index, movie in
                                ComingSoonRow(movie: movie, movieDetailToShow: $movieDetialToShow)
                                    .frame(height: 400)
                                    .overlay(
                                        Group {
                                            index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                        }
                                        .animation(.easeInOut)
                                    )
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    
//                    Text("\(scrollOffset)")
//                        .background(Color.red)
                }
                .navigationDestination(
                     isPresented: $showNotificationList) {
                         Text("Notification List")
                         EmptyView()
                     }
                     .navigationTitle("")
                     .navigationBarHidden(navBarHidden)
                     .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                         self.navBarHidden = true
                     })
                     .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                         self.navBarHidden = false
                     })
            }
//        }
    }
    
    private func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let remove = scroll - 105
            let active =  Int(remove / (screen.size.height/2)) + 1
            activeIndex = Int(active)
        }
    }
}

#Preview {
    ComingSoon()
}
