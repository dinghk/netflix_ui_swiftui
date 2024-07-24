//
//  ArrayExtension.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import Foundation

extension Array where Element : Equatable {
    func isLast(element: Element) -> Bool {
        last == element
    }
}
