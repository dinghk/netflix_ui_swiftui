//
//  TrailerPlayerView.swift
//  MyNetflix
//
//  Created by Ding Lo on 24/7/2024.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    var videoURL: URL?
    
    @Binding var isPlayVideo: Bool
    
    var body: some View {
        if let url = videoURL {
            VideoPlayer(url: url, play: $isPlayVideo)
        } else {
            Text("Could not load video")
        }
    }
}

#Preview {
    TrailerPlayerView(videoURL: nil, isPlayVideo: .constant(true))
}
