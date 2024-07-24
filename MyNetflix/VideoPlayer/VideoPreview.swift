//
//  VideoPreview.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import SwiftUI
import Kingfisher

struct VideoPreview: View {
    var imageURL: URL
    var videoURL: URL
    
    @State private var showingVideoPlayer = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button {
                showingVideoPlayer = true
            } label: {
                Image(systemName: "play.circle")
                    .foregroundStyle(.white)
                    .font(.system(size: 40))
            }
            .sheet(isPresented: $showingVideoPlayer, content: {
                VideoView(url: videoURL)
            })

        }
    }
}

#Preview {
    VideoPreview(imageURL: exampleImageURL1, videoURL: exampleVideoURL)
}
