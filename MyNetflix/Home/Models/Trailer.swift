//
//  Trailer.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
