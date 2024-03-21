//
//  CurrentWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"

    private let cityLabel = UILabel(
        font: .systemFont(ofSize: 36, weight: .bold)
        ,textAlignment: .center
    )
    private let tempLabel = UILabel(
        font: .systemFont(ofSize: 40, weight: .medium),
        textAlignment: .center
    )
    private let conditionLabel = UILabel(font: .systemFont(ofSize: 26, weight: .regular))
    private let icon = UIImageView(height: 42, width: 42)
    private let conditionStackView = UIStackView(
        axis: .vertical,
        alignment: .center,
        distribution: .fillEqually,
        spacing: 4
    )
    private let precipitationIcon = UIImageView(imageName: "cloud.rain")
    private let windSpeedIcon = UIImageView(imageName: "wind")
    private let humidityIcon = UIImageView(imageName: "humidity")
    private let precipitationLabel = UILabel(
        font: .systemFont(ofSize: 18, weight: .regular),
        textAlignment: .center
    )
    private let windSpeedLabel = UILabel(
        font: .systemFont(ofSize: 18, weight: .regular),
        textAlignment: .center
    )
    private let humidityLabel = UILabel(
        font: .systemFont(ofSize: 18, weight: .regular),
        textAlignment: .center
    )
    private let precipitationStackView = UIStackView(axis: .vertical, alignment: .center, spacing: 8)
    private let windSpeedStackView = UIStackView(axis: .vertical, alignment: .center, spacing: 8)
    private let humidityStackView = UIStackView(axis: .vertical, alignment: .center, spacing: 8)
    private let overallStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 4)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
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
    
    private func setupViews() {
        [cityLabel, tempLabel, conditionStackView, overallStackView].forEach(contentView.addSubview(_:))
        [icon, conditionLabel].forEach(conditionStackView.addArrangedSubview(_:))
        [precipitationIcon, precipitationLabel].forEach(precipitationStackView.addArrangedSubview(_:))
        [windSpeedIcon, windSpeedLabel].forEach(windSpeedStackView.addArrangedSubview(_:))
        [humidityIcon, humidityLabel].forEach(humidityStackView.addArrangedSubview(_:))
        [precipitationStackView, windSpeedStackView, humidityStackView].forEach(overallStackView.addArrangedSubview(_:))
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
            
            overallStackView.topAnchor.constraint(equalTo: conditionStackView.bottomAnchor, constant: 10),
            overallStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            overallStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            overallStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
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
