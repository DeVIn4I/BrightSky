//
//  WeatherManager.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    private init() {}
    
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    public private(set) var cityName: String?
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                
                self.currentWeather = result.currentWeather
                self.hourlyWeather = Array(result.hourlyForecast.forecast.prefix(24))
                self.dailyWeather = Array(result.dailyForecast.forecast.prefix(7))
                
                let geocoder = CLGeocoder()
                let placemarks = try await geocoder.reverseGeocodeLocation(location)
                if let place = placemarks.first, let city = place.locality {
                    self.cityName = city
                }
                completion()
            } catch {
                print(String(describing: error))
            }
        }
    }
}

extension WeatherManager {
    public func getWeather(forCity cityName: String, completion: @escaping () -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cityName) {
            [weak self] placemarks,
            error in
            guard let self = self,
                  let location = placemarks?.first?.location
            else {
                print("⭕️Ошибка геокодирования: \(String(describing: error))")
                return
            }
            self.getWeather(for: location, completion: completion)
        }
    }
}
