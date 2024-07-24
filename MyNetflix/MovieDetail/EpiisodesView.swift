//
//  EpiisodesView.swift
//  MyNetflix
//
//  Created by Ding Lo on 22/7/2024.
//

import SwiftUI

struct EpiisodesView: View {
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        VStack(spacing: 14) {
            // Seasion Picker
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                Spacer()
            }
            
            // Episodes list
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                VStack(alignment: .leading) {
                    // preview image
                    HStack {
                        VideoPreview(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                            Text("\(episode.length)")
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
                    
                    // description
                    Text(episode.description)
                        .font(.system(size: 13))
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
    }
    
    private func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter ({ $0.season == season })
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        EpiisodesView(episodes: [episode1, episode2, episode3], showSeasonPicker: .constant(false), selectedSeason: .constant(1))
    }
}
