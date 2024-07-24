//
//  NotificationBar.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button(action: {
            // show notification list
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                Text("Notifications")
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        })
        .foregroundStyle(.white)
        .padding()
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        NotificationBar(showNotificationList: .constant(false))
    }
}
