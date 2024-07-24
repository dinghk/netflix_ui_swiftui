//
//  LinearGradientExtension.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static let backOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [.clear, .black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}
