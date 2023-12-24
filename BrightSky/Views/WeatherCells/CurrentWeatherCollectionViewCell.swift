//
//  CurrentWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
