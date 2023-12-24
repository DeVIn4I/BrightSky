//
//  CurrentWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 62, weight: .medium)
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34, weight: .regular)
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
        
        contentView.addSubview(tempLabel)
        contentView.addSubview(icon)
        contentView.addSubview(conditionLabel)
        
        addConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        conditionLabel.text = nil
        tempLabel.text = nil
        icon.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            icon.heightAnchor.constraint(equalToConstant: 55),
            icon.widthAnchor.constraint(equalToConstant: 55),
            icon.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            conditionLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            conditionLabel.heightAnchor.constraint(equalToConstant: 80),
            conditionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            conditionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            conditionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    public func configure(with viewModel: CurrentWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        conditionLabel.text = viewModel.codition
        tempLabel.text = viewModel.temperature
    }
}
