//
//  HourlyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HourlyWeatherCollectionViewCell"
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.secondaryLabel.cgColor
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(timeLabel)
        contentView.addSubview(icon)
        contentView.addSubview(tempLabel)
        
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
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            icon.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            icon.heightAnchor.constraint(equalToConstant: 30),
            
            tempLabel.topAnchor.constraint(equalTo: icon.bottomAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    public func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        timeLabel.text = viewModel.hour
    }
}

