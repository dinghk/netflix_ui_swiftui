//
//  StringExtension.swift
//  MyNetflix
//
//  Created by Ding Lo on 19/7/2024.
//

import Foundation
import UIKit

extension String {
    func widthOfString(withFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
