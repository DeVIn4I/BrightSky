//
//  CurrentWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.text = "Moscow"
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .medium)
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let conditionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.alignment = .center
        return stackView
    }()
    
    private let precipitationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "cloud.rain")
        return imageView
    }()

    private let windSpeedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "wind")
        return imageView
    }()

    private let humidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "humidity")
        return imageView
    }()

    private let precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    private let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cityLabel)
        contentView.addSubview(tempLabel)

        [icon, conditionLabel].forEach { conditionStackView.addArrangedSubview($0)}

        contentView.addSubview(conditionStackView)

        
        addConstraints()
        
        setupWeatherInfoStackView()
        
        [precipitationIcon, windSpeedIcon, humidityIcon].forEach { icon in
               icon.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   icon.widthAnchor.constraint(equalToConstant: 30),
                   icon.heightAnchor.constraint(equalToConstant: 30)
               ])
           }
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
    
    private func setupWeatherInfoStackView() {
        let precipitationStackView = UIStackView(arrangedSubviews: [precipitationIcon, precipitationLabel])
        precipitationStackView.axis = .vertical
        precipitationStackView.alignment = .center
        precipitationStackView.spacing = 8

        let windSpeedStackView = UIStackView(arrangedSubviews: [windSpeedIcon, windSpeedLabel])
        windSpeedStackView.axis = .vertical
        windSpeedStackView.spacing = 8
        windSpeedStackView.alignment = .center

        let humidityStackView = UIStackView(arrangedSubviews: [humidityIcon, humidityLabel])
        humidityStackView.axis = .vertical
        humidityStackView.spacing = 8
        humidityStackView.alignment = .center

        let overallStackView = UIStackView(arrangedSubviews: [precipitationStackView, windSpeedStackView, humidityStackView])
        overallStackView.axis = .horizontal
        overallStackView.distribution = .fillEqually
        overallStackView.spacing = 4
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(overallStackView)

        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: conditionStackView.bottomAnchor, constant: 10),
            overallStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            overallStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            overallStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            
        ])
    }

    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            conditionStackView.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 12),
            conditionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            conditionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            icon.heightAnchor.constraint(equalToConstant: 36),
            icon.widthAnchor.constraint(equalToConstant: 36),
            
        ])
    }
    
    public func configure(with viewModel: CurrentWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        conditionLabel.text = viewModel.conditionRussian
        tempLabel.text = viewModel.temperature
        precipitationLabel.text = viewModel.precipitation
        windSpeedLabel.text = viewModel.windSpeed
        humidityLabel.text = viewModel.humidity
        cityLabel.text = viewModel.cityName
    }
}
