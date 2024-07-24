//
//  VideoView.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import SwiftUI
import AVKit

struct VideoView: View {
    let url: URL
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

#Preview {
    VideoView(url: exampleVideoURL)
}
