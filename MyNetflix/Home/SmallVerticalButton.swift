//
//  SmallVerticalButton.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    var isOn: Bool
    var color: Color = Color.white
    
    var action: (()->Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: isOn ? isOnImage : isOffImage)
                    .foregroundColor(color)
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 14))
                    .bold()
            }
        }

    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        SmallVerticalButton(
            text: "My List",
            isOnImage: "checkmark",
            isOffImage: "plus",
            isOn: true) {
            print("Tap")
        }
    }
}
