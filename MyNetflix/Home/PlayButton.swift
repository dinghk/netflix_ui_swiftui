//
//  WhiteButton.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import SwiftUI

struct PlayButton: View {
    var text: String
    var imageName: String
    var backgroundColor: Color = .white
    var action: (()->Void)
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                
                Image(systemName: imageName)
                    .font(.headline)
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundStyle(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(3)
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        PlayButton(text: "Play", imageName: "play.fill") {
            //
        }
    }
}
