//
//  DailyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DailyWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: DailyWeatherCollectionViewCellViewModel) {
        
    }
}
