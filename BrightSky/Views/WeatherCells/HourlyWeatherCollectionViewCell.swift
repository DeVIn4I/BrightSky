//
//  HourlyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HourlyWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

