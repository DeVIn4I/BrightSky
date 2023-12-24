//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import Foundation
import WeatherKit

struct CurrentWeatherCollectionViewCellViewModel {
    private let model: CurrentWeather
    
    init(model: CurrentWeather) {
        self.model = model
    }
}
