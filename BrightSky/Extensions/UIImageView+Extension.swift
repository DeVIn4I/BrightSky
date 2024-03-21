//
//  UIImageView+Extension.swift
//  BrightSky
//
//  Created by Razumov Pavel on 21.03.2024.
//

import UIKit

extension UIImageView {
    
    convenience init(
        imageName: String? = nil,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        height: CGFloat = 30,
        width: CGFloat = 30
    ) {
        self.init()
        if let imageName, let image = UIImage(systemName: imageName){
            self.image = image
        }
        self.contentMode = contentMode
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
