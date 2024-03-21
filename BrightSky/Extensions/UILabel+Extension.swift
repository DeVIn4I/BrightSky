//
//  UILabel+Extension.swift
//  BrightSky
//
//  Created by Razumov Pavel on 21.03.2024.
//

import UIKit

extension UILabel {
    convenience init(
        text: String? = nil,
        font: UIFont? = nil,
        textColor: UIColor? = nil,
        textAlignment: NSTextAlignment = .left,
        lines: Int = 0
    ) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = lines
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
