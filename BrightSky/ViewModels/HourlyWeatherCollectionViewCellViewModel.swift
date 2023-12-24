//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import Foundation
import WeatherKit

struct HourlyWeatherCollectionViewCellViewModel {
    private let model: HourWeather
    
    init(model: HourWeather) {
        self.model = model
    }
}
