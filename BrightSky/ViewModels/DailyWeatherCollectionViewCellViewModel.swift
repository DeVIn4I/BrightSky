//
//  DailyWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import Foundation
import WeatherKit

struct DailyWeatherCollectionViewCellViewModel {
    private let model: DayWeather
    
    init(model: DayWeather) {
        self.model = model
    }
}
