//
//  HourlyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

final class HourlyWeatherCollectionViewCell: UICollectionViewCell {
     //MARK: - Private Properties
    private let tempLabel = UILabel(font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .center)
    private let timeLabel = UILabel(font: .systemFont(ofSize: 15, weight: .regular), textAlignment: .center)
    private let icon = UIImageView(contentMode: .scaleAspectFit)
    
     //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [timeLabel, icon, tempLabel].forEach(contentView.addSubview(_:))
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.secondaryLabel.cgColor
        contentView.backgroundColor = .secondarySystemBackground
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        icon.image = nil
        tempLabel.text = nil
        timeLabel.text = nil
    }
     //MARK: - Private Methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            icon.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            icon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            tempLabel.topAnchor.constraint(equalTo: icon.bottomAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
     //MARK: - Public Methods
    public func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        timeLabel.text = viewModel.hour
    }
}

