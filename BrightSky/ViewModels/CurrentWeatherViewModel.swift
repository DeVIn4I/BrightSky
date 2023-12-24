//
//  CurrentWeatherViewModel.swift
//  BrightSky
//
//  Created by Razumov Pavel on 24.12.2023.
//

import Foundation

enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModels: [HourlyWeatherCollectionViewCellViewModel])
    case daily(viewModels: [DailyWeatherCollectionViewCellViewModel])
}
