//
//  DailyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DailyWeatherCollectionViewCell"
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()

    private let timeLabel = UILabel(font: .systemFont(ofSize: 22, weight: .medium), textAlignment: .center)
    private let icon = UIImageView(contentMode: .scaleAspectFit)
 
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

    private func addConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 30),
            
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    public func configure(with viewModel: DailyWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        timeLabel.text = viewModel.date
    }
}
