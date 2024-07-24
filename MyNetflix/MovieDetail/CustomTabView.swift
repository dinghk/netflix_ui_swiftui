//
//  CustomTab.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import SwiftUI
enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabView: View {
    var tabs: [CustomTab]
    let movie: Movie
    
    @State private var currenTab: CustomTab = .episodes
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    private func getTabWidth(_ tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(withFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            // Tab
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id:\.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: getTabWidth(tab), height: 6)
                                .foregroundStyle(currenTab == tab ? .red : .clear)
                            
                            Button(action: {
                                currenTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(currenTab == tab ? .white : .gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: getTabWidth(tab), height: 30)
                        }
                    }
                }
            }
            
            // Selected
            switch currenTab {
            case .episodes:
                EpiisodesView(episodes: movie.epidsodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeMovies)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        CustomTabView(tabs: [.episodes, .trailers, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
    }
}
