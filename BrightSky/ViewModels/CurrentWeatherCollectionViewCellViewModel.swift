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
    let cityName: String
    
    init(model: CurrentWeather, cityName: String) {
        self.model = model
        self.cityName = cityName
    }
    
    public var temperature: String {
        return String(format: "%.2f", model.temperature.value) + " °C"
    }
    
    public var iconName: String {
        return model.symbolName
    }
    
    public var precipitation: String {
        return String(format: "%.2f", model.precipitationIntensity.value) + " мм"
    }
    
    public var windSpeed: String {
        return String(format: "%.2f", model.wind.speed.value) + " км/ч"
    }
    
    public var humidity: String {
        return String(format: "%.2f", model.humidity)
    }
    
    public var conditionRussian: String {
        switch model.condition {
        case .blowingDust:
                return "Пыльная буря"
        case .clear:
                return "Ясно"
            case .cloudy:
                return "Облачно"
            case .foggy:
                return "Туман"
        case .haze:
                return "Мгла"
        case .mostlyClear:
                return "В основном ясно"
        case .mostlyCloudy:
                return "В основном облачно"
        case .partlyCloudy:
                return "Переменная облачность"
        case .smoky:
                return "Дымка"
        case .breezy:
                return "Легкий ветер"
        case .windy:
                return "Ветрено"
        case .drizzle:
                return "Морось"
        case .heavyRain:
                return "Ливень"
        case .isolatedThunderstorms:
                return "Локальные грозы"
        case .rain:
                return "Дождь"
        case .sunShowers:
                return "Дождь на солнце"
        case .scatteredThunderstorms:
                return "Рассеянные грозы"
        case .strongStorms:
                return "Сильные штормы"
        case .thunderstorms:
                return "Грозы"
        case .frigid:
                return "Ледяной"
        case .hail:
                return "Град"
        case .hot:
                return "Жарко"
        case .flurries:
                return "Снегопады"
        case .sleet:
                return "Мокрый снег"
        case .snow:
                return "Снег"
        case .sunFlurries:
                return "Солнечные снегопады"
        case .wintryMix:
                return "Зимняя смесь"
        case .blizzard:
                return "Метель"
        case .blowingSnow:
                return "Снежные заносы"
        case .freezingDrizzle:
                return "Замерзающая морось"
        case .freezingRain:
                return "Ледяной дождь"
        case .heavySnow:
                return "Сильный снегопад"
            default:
                return "Неизвестно"
            }
        }
}
